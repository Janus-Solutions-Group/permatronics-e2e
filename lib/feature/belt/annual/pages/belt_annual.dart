import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:manlift_app/feature/Home/pages/homepage.dart';
import 'package:manlift_app/feature/belt/annual/widget/add_intermediate_landing.dart';
import 'package:manlift_app/feature/common/widgets/header_form.dart';
import 'package:manlift_app/feature/common/widgets/image_picking_last.dart';
import 'package:manlift_app/feature/common/widgets/reference_text.dart';
import 'package:manlift_app/feature/common/widgets/signature_pad.dart';
import 'package:manlift_app/feature/final/final_page.dart';
import 'package:manlift_app/provider/selection_ref_provider.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/header.dart';
import '../../../common/widgets/radio_tile.dart';
import '../../model/belt_inspection_model.dart';
import '../widget/belting.dart';
import '../widget/bottom_landing.dart';
import '../widget/bottom_landing_hood.dart';
import '../widget/bottom_landing_safeties.dart';
import '../widget/drive_assembly.dart';
import '../widget/electrical.dart';
import '../widget/handholds.dart';
import '../widget/load_test.dart';
import '../widget/steps.dart';
import '../widget/tail_section.dart';
import '../widget/intermediate_landing.dart';
import '../widget/top_landing.dart';
import '../widget/top_landing_safeties.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class BeltAnnualPage extends StatefulWidget {
  const BeltAnnualPage({super.key, required this.title});

  final String title;

  @override
  State<BeltAnnualPage> createState() => _BeltAnnualPageState();
}

class _BeltAnnualPageState extends State<BeltAnnualPage> {
  final pageController = PageController();

  final beltModel = BeltInspection();
  final headerModel = HeaderModel();

  Map<String, dynamic> data = {};

  fetchJsonData() async {
    final res = await rootBundle.loadString('assets/belt.json');
    Map<String, dynamic> mapResponse = jsonDecode(res);
    setState(() {
      data = mapResponse;
    });
  }

  @override
  void initState() {
    fetchJsonData();
    super.initState();
  }

  Future<void> createinspectionPdf() async {
    List<String> list = [];
    beltModel.toMap().forEach((u, v) {
      if (v != null) {
        list.add(v.toString());
      }
    });
    List<String> headerList = [];
    headerModel.toMap().forEach((u, v) {
      if (v != null) headerList.add(v.toString());
    });

    // await generatePdf(list);
    final pdf = pw.Document();

    final img = await rootBundle.load('assets/perma_tronic.png');
    final imageBytes = img.buffer.asUint8List();
    pw.Image image1 = pw.Image(pw.MemoryImage(imageBytes));

    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            pw.Container(
              alignment: pw.Alignment.center,
              height: 180,
              child: image1,
            ),
            pw.SizedBox(height: 10),
            pw.Align(
              alignment: pw.Alignment.center,
              child: pw.Text('Inspection Report',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),
            pw.SizedBox(height: 10),
            ...List.generate(
                headerList.length, (index) => pw.Text(headerList[index])),
            pw.SizedBox(height: 10),
            pw.Align(
              alignment: pw.Alignment.center,
              child: pw.Text('Inspection Findings',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),
            pw.SizedBox(height: 10),
            ...List.generate(list.length, (index) => pw.Text(list[index])),
            pw.SizedBox(height: 10),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('ASME A90.1 Safety Standard for Belt Manlifts'),
                pw.Text(
                    "We thank you for the opportunity to visit your facility. Should you have any questions and / or comments concerning this report or any manlift related need, please do nothesitate to give us a call at your earliest convenience."),
                pw.SizedBox(height: 20),
                pw.Text("Respectfully Submitted,"),
                pw.Text("Perma Tronic Elevator, Inc."),
                pw.Text(r"VP\GM"),
                pw.Text("gordon.butler@permatronic.com"),
              ],
            )
          ];
        }));
    // final output = await getExternalStorageDirectory();
    final directory = Directory("/storage/emulated/0/Download");
    final path = directory.path;
    print(path);

    await Directory(path).create(recursive: true);
    final file = File(
        "$path/belt_annual_${DateFormat('yyyy-MM-dd_HH-mm-ss').format(DateTime.now())}.pdf");
    await file.writeAsBytes(await pdf.save());

    if (mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('pdf is created')));
    }
  }

  Future<void> createrefrencePdf() async {
    List<String> headerList = [];
    headerModel.toMap().forEach((u, v) {
      if (v != null) headerList.add(v.toString());
    });
    final pdf = pw.Document();

    pw.Image? image1 =
        signature != null ? pw.Image(pw.MemoryImage(signature!)) : null;
    var selectionsRef = context.read<SelectionRefProvider>().selectionsRef;
    selectionsRef.sort((a, b) {
      final id1 = a['id']!;
      final id2 = b['id']!;

      final regex = RegExp(r'(\d+|\D+)');
      final parts1 = regex.allMatches(id1).map((m) => m.group(0)!).toList();
      final parts2 = regex.allMatches(id2).map((m) => m.group(0)!).toList();

      for (var i = 0; i < parts1.length && i < parts2.length; i++) {
        final p1 = parts1[i];
        final p2 = parts2[i];

        final n1 = int.tryParse(p1);
        final n2 = int.tryParse(p2);

        if (n1 != null && n2 != null) {
          final diff = n1.compareTo(n2);
          if (diff != 0) return diff;
        } else {
          final diff = p1.compareTo(p2);
          if (diff != 0) return diff;
        }
      }

      return parts1.length.compareTo(parts2.length);
    });


    var tailList = selectionsRef
        .where((a) => a['id']!.split('_').first == "tail")
        .toList();
    var bottomLandingSafetiesList = selectionsRef
        .where((a) => a['id']!.startsWith('Bottom Landing Safeties'))
        .toList();
    var bottomLandingList = selectionsRef
        .where((a) => a['id']!.startsWith("bottom_landing_annual"))
        .toList();
    var bottomLandingHoodList = selectionsRef
        .where((a) => a['id']!.startsWith("bottom_landing_hood"))
        .toList();
    var beltingList = selectionsRef
        .where((a) => a['id']!.startsWith("belting_annual"))
        .toList();

    var handholdsList = selectionsRef
        .where((a) => a['id']!.startsWith("handholds_annual"))
        .toList();
    var stepList =
        selectionsRef.where((a) => a['id']!.startsWith("step_belt")).toList();

    var intermediateList =
        selectionsRef.where((a) => a['id']!.startsWith("landing")).toList();

    var topLandingList =
        selectionsRef.where((a) => a['id']!.startsWith("top_landing")).toList();
    var driveAssemblyList = selectionsRef
        .where((a) => a['id']!.startsWith("drive_assembly"))
        .toList();
    var topLandingSafeties = selectionsRef
        .where((a) => a['id']!.startsWith("top_landing_safeties"))
        .toList();
    var electricalList = selectionsRef
        .where((a) => a['id']!.startsWith("electrical_annual"))
        .toList();
    var loadTestList =
        selectionsRef.where((a) => a['id']!.startsWith("load_test")).toList();
    final landingGroups = <String, List<Map<String, String?>>>{};
    for (var item in selectionsRef) {
      final id = item['id']!;
      final parts = id.split('_');

      if (parts.first == "landing") {
        final index = parts[1]; // extract the landing index

        landingGroups.putIfAbsent(index, () => []);
        landingGroups[index]!.add(item);
      }
    }
    print(landingGroups);

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            pw.Align(
              alignment: pw.Alignment.center,
              child: pw.Text('Inspection Reference',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),
            pw.SizedBox(height: 10),
            ...List.generate(
                headerList.length, (index) => pw.Text(headerList[index])),
            pw.SizedBox(height: 10),
            referenceText(tailList, 'Tail Section'),
            referenceText(bottomLandingSafetiesList, 'Bottom Landing Safeties'),
            referenceText(bottomLandingList, 'Bottom Landing'),
            referenceText(bottomLandingHoodList, 'Bottom Landing Hood'),
            referenceText(beltingList, 'Belting'),
            referenceText(handholdsList, 'Handholds'),
            referenceText(stepList, 'Steps'),
            ...landingGroups.entries.map((entry) {
              final index = int.parse(entry.key) + 1;
              final items = entry.value;
              return referenceText(items, 'Intermediate Landing $index');
            }),
            referenceText(topLandingList, 'Top Landing'),
            referenceText(driveAssemblyList, 'Drive Assembly'),
            referenceText(topLandingSafeties, 'Top Landing Safeties'),
            referenceText(electricalList, 'Electrical'),
            referenceText(loadTestList, 'Load Test'),
            pw.Container(
              alignment: pw.Alignment.centerRight,
              height: 100,
              child: image1,
            ),
          ];
        },
      ),
    );

    final directory = Directory("/storage/emulated/0/Download");
    final path = directory.path;
    print(path);

    await Directory(path).create(recursive: true);
    final file = File(
        "$path/belt_annual_ref_${DateFormat('yyyy-MM-dd_HH-mm-ss').format(DateTime.now())}.pdf");
    await file.writeAsBytes(await pdf.save());

    selectionsRef.clear();
    if (mounted) {
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('reference pdf is created')));
    }
  }

  Uint8List? signature;

  @override
  Widget build(BuildContext context) {
    return BeltAnnualJson(
      data: data,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: pageController,
                  children: [
                    HeaderForm(
                        pageController: pageController,
                        headerModel: headerModel),
                    TailSection(
                        pageController: pageController, beltModel: beltModel),
                    BottomLandingSafeties(
                      pageController: pageController,
                      beltModel: beltModel,
                    ),
                    BottomLanding(
                      pageController: pageController,
                      beltModel: beltModel,
                    ),
                    BottomLandingHood(
                      pageController: pageController,
                      beltModel: beltModel,
                    ),
                    Belting(
                      pageController: pageController,
                      beltModel: beltModel,
                    ),
                    Handholds(
                      pageController: pageController,
                      beltModel: beltModel,
                    ),
                    Steps(
                      pageController: pageController,
                      beltModel: beltModel,
                    ),
                    // IntermediateLanding(
                    //   pageController: pageController,
                    //   beltModel: beltModel,
                    // ),
                    AddAnnualIntermediateLandingFormPage(
                      pageController: pageController,
                    ),
                    TopLanding(
                      pageController: pageController,
                      beltModel: beltModel,
                    ),
                    DriveAssembly(
                      pageController: pageController,
                      beltModel: beltModel,
                    ),
                    TopLandingSafeties(
                      pageController: pageController,
                      beltModel: beltModel,
                    ),
                    Electrical(
                      pageController: pageController,
                      beltModel: beltModel,
                    ),
                    LoadTest(
                      pageController: pageController,
                      beltModel: beltModel,
                    ),
                    SignaturePad(
                      pageController: pageController,
                      signatureChanged: (value) async {
                        final png = await value.toByteData(
                            format: ui.ImageByteFormat.png);
                        signature = Uint8List.view(png!.buffer);
                        setState(() {});
                      },
                    ),
                    ImagePickingWidget(
                      pageController: pageController,
                      onSubmit: () async {
                        await createinspectionPdf();
                        await createrefrencePdf();
                        await GetStorage().erase();
                        if (context.mounted) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FinalPage()));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BeltAnnualJson extends InheritedWidget {
  const BeltAnnualJson({super.key, required this.data, required super.child});

  final Map<String, dynamic> data;

  static BeltAnnualJson? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BeltAnnualJson>();
  }

  @override
  bool updateShouldNotify(BeltAnnualJson oldWidget) {
    return oldWidget.data != data;
  }
}
