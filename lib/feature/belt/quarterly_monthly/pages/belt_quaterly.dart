import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:manlift_app/data/models/header.dart';
import 'package:manlift_app/feature/belt/quarterly_monthly/widget/belting.dart';
import 'package:manlift_app/feature/belt/quarterly_monthly/widget/bottom_landing.dart';
import 'package:manlift_app/feature/belt/quarterly_monthly/widget/bottom_landing_hood.dart';
import 'package:manlift_app/feature/belt/quarterly_monthly/widget/bottom_landing_safeties.dart';
import 'package:manlift_app/feature/belt/quarterly_monthly/widget/drive_assembly.dart';
import 'package:manlift_app/feature/belt/quarterly_monthly/widget/handholds.dart';
import 'package:manlift_app/feature/belt/quarterly_monthly/widget/steps.dart';
import 'package:manlift_app/feature/belt/quarterly_monthly/widget/tail_section.dart';
import 'package:manlift_app/feature/belt/quarterly_monthly/widget/top_landing.dart';
import 'package:manlift_app/feature/belt/quarterly_monthly/widget/top_landing_safeties.dart';
import 'package:manlift_app/feature/common/widgets/header_form.dart';
import 'package:manlift_app/feature/common/widgets/image_picking_last.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';
import 'package:manlift_app/feature/final/final_page.dart';

import '../../../common/widgets/signature_pad.dart';
import '../../model/belt_inspection_model.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../widget/add_intermediate_landing.dart';

class BeltQuaterlyPage extends StatefulWidget {
  const BeltQuaterlyPage({super.key, required this.title});

  final String title;

  @override
  State<BeltQuaterlyPage> createState() => _BeltQuaterlyPageState();
}

class _BeltQuaterlyPageState extends State<BeltQuaterlyPage> {
  final pageController = PageController();
  final headerModel = HeaderModel();
  final beltModel = BeltInspection();
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

  Future<void> createInspectionPdf() async {
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
            ),
            // if (image != null)
            //   pw.Image(pw.MemoryImage(image))
          ];
        }));
    // final output = await getExternalStorageDirectory();
    final directory = Directory("/storage/emulated/0/Download");
    final path = directory.path;
    print(path);

    await Directory(path).create(recursive: true);
    final file = File(
        "$path/belt_quarterly_${DateFormat('yyyy-MM-dd_HH-mm-ss').format(DateTime.now())}.pdf");
    await file.writeAsBytes(await pdf.save());

    if (mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('pdf is created')));
    }
  }

  Future<void> createrefrencePdf() async {
    final pdf = pw.Document();

    pw.Image? image1 =
        signature != null ? pw.Image(pw.MemoryImage(signature!)) : null;

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            ...List.generate(
                selectionsRef.length,
                (index) => pw.Padding(
                      padding: const pw.EdgeInsets.only(bottom: 10),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            selectionsRef[index]['title'].toString(),
                            style: pw.TextStyle(
                              fontSize: 16,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.Text(selectionsRef[index]['value'].toString()),
                        ],
                      ),
                    )),
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
        "$path/belt_quarterly_ref_${DateFormat('yyyy-MM-dd_HH-mm-ss').format(DateTime.now())}.pdf");
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
    return BeltJson(
      data: data,
      runFunction: fetchJsonData,
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
                    TailSectionFootAssembly(
                      pageController: pageController,
                      beltModel: beltModel,
                    ),
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
                    AddQuarterlyIntermediateLandingFormPage(
                        pageController: pageController),
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
                      beltModel: beltModel,
                      onSubmit: () async {
                        await createInspectionPdf();
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

class BeltJson extends InheritedWidget {
  const BeltJson({
    super.key,
    required super.child,
    required this.data,
    required this.runFunction,
  });

  final Map<String, dynamic> data;
  final Function() runFunction;

  static BeltJson? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BeltJson>();
  }

  @override
  bool updateShouldNotify(BeltJson oldWidget) {
    return oldWidget.data != data;
  }
}
