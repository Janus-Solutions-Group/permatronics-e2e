import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:manlift_app/feature/cage/annual/widgets/add_landing_form.dart';
import 'package:manlift_app/feature/cage/annual/widgets/cab_form.dart';
import 'package:manlift_app/feature/cage/annual/widgets/car_counterweight_form.dart';
import 'package:manlift_app/feature/cage/annual/widgets/drive_support.dart';
import 'package:manlift_app/feature/cage/annual/widgets/electrical_control.dart';
import 'package:manlift_app/feature/cage/annual/widgets/load_test.dart';
import 'package:manlift_app/feature/cage/model/cage_model.dart';
import 'package:manlift_app/feature/cage/model/pit_model.dart';
import 'package:manlift_app/feature/common/widgets/header_form.dart';
import 'package:manlift_app/feature/cage/annual/widgets/yearly_pit_form.dart';
import 'package:manlift_app/feature/common/widgets/image_picking_last.dart';
import 'package:manlift_app/feature/common/widgets/reference_text.dart';
import 'package:manlift_app/feature/common/widgets/signature_pad.dart';
import 'package:manlift_app/provider/selection_ref_provider.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../data/models/header.dart';
import '../../../final/final_page.dart';

class CageAnnualyPage extends StatefulWidget {
  const CageAnnualyPage({super.key});

  @override
  State<CageAnnualyPage> createState() => _CageAnnualyPageState();
}

class _CageAnnualyPageState extends State<CageAnnualyPage> {
  final pageController = PageController();
  final cageModel = CageInspection();
  final pitModel = PitModel();
  final headerModel = HeaderModel();

  Map<String, dynamic> data = {};

  fetchJsonData() async {
    final res = await rootBundle.loadString('assets/cage.json');
    Map<String, dynamic> mapResponse = jsonDecode(res);
    setState(() {
      data = mapResponse;
    });
  }

  List<ScreenshotController> screenshotController = List.generate(
    10,
    (i) => ScreenshotController(),
  );

  @override
  void initState() {
    fetchJsonData();
    super.initState();
  }

  // Future<void> _capture() async {
  //   final pdf = pw.Document();
  //   pw.Image? image1 =
  //       signature != null ? pw.Image(pw.MemoryImage(signature!)) : null;
  //   pdf.addPage(
  //     pw.MultiPage(
  //       pageFormat: PdfPageFormat.a4,
  //       build: (pw.Context context) {
  //         return [
  //           pw.Align(
  //             alignment: pw.Alignment.center,
  //             child: pw.Text('Inspection Reference',
  //                 style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
  //           ),
  //           pw.Container(
  //             alignment: pw.Alignment.centerRight,
  //             height: 100,
  //             child: image1,
  //           ),
  //         ];
  //       },
  //     ),
  //   );
  //   final directory = Directory("/storage/emulated/0/Download");
  //   final path = directory.path;
  //   await Directory(path).create(recursive: true);
  //   final file = File(
  //       "$path/cage_annual_ref_image_${DateFormat('yyyy-MM-dd_HH-mm-ss').format(DateTime.now())}.pdf");
  //   await file.writeAsBytes(await pdf.save());
  // }

  Future<void> createinspectionPdf() async {
    List<String> list = [];
    cageModel.toMap().forEach((u, v) {
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
                pw.Text(
                    'ASME CODE A17.1 Safety Standards for Special Purpose Personnel Elevators'),
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
    String fileName =
        "cage_annual_${DateFormat('yyyy-MM-dd_HH-mm-ss').format(DateTime.now())}";
    DateFormat('dd-MM-YYYY_HH:mm').format(DateTime.now()).toString();
    final file = File("${"$path/$fileName"}.pdf");
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


    var pitList = selectionsRef.where((a) => a['id']!.contains('pit')).toList();
    var landing =
        selectionsRef.where((a) => a['id']!.contains('landing')).toList();
    var cabList = selectionsRef.where((a) => a['id']!.contains('cab')).toList();
    var carCounterweight =
        selectionsRef.where((a) => a['id']!.contains('car')).toList();
    var driveList =
        selectionsRef.where((a) => a['id']!.contains('drive')).toList();
    var electrical =
        selectionsRef.where((a) => a['id']!.contains('electrical')).toList();
    var loadList =
        selectionsRef.where((a) => a['id']!.contains('load')).toList();

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
            referenceText(pitList, 'Pit'),

            ...landingGroups.entries.map((entry) {
              final index = int.parse(entry.key) + 1;
              final items = entry.value;
              return referenceText(items, 'Landing $index');
            }),
            referenceText(cabList, 'Cab Form'),
            referenceText(carCounterweight, 'Car Counter Weight'),
            referenceText(driveList, 'Drive Support'),
            referenceText(electrical, 'Electrical Control'),
            referenceText(loadList, 'Load Test'),
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

    await Directory(path).create(recursive: true);
    final file = File(
        "$path/cage_annual_ref_${DateFormat('yyyy-MM-dd_HH-mm-ss').format(DateTime.now())}.pdf");
    await file.writeAsBytes(await pdf.save());

    selectionsRef.clear();
    if (mounted) {
      setState(() {});
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('pdf is created')));
    }
  }

  Uint8List? signature;

  @override
  Widget build(BuildContext context) {
    return CageAnnualJson(
      data: data,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cage Yearly Form"),
          automaticallyImplyLeading: false,
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     await captureAllPages();
        //   },
        // ),
        body: SafeArea(
          child: PageView(
            controller: pageController,
            children: [
              HeaderForm(
                  pageController: pageController, headerModel: headerModel),
              YearlyPitInspectionForm(
                pageController: pageController,
                cageModel: cageModel,
              ),
              AddAnnualLandingFormPage(pageController: pageController),
              AnnualCageCABForm(
                pageController: pageController,
                cageModel: cageModel,
              ),
              AnnualCageCarCounterWeightForm(
                pageController: pageController,
                cageModel: cageModel,
              ),
              AnnualCageDriveSupportForm(
                pageController: pageController,
                cageModel: cageModel,
              ),
              AnnualCageElectricalControlForm(
                pageController: pageController,
                cageModel: cageModel,
              ),
              AnnualCageLoadTests(
                pageController: pageController,
                cageModel: cageModel,
              ),

              // signature is left
              SignaturePad(
                pageController: pageController,
                signatureChanged: (value) async {
                  final png =
                      await value.toByteData(format: ui.ImageByteFormat.png);
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
      ),
    );
  }
}

class CageAnnualJson extends InheritedWidget {
  const CageAnnualJson({super.key, required this.data, required super.child});

  final Map<String, dynamic> data;

  static CageAnnualJson? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CageAnnualJson>();
  }

  @override
  bool updateShouldNotify(CageAnnualJson oldWidget) {
    return oldWidget.data != data;
  }
}
