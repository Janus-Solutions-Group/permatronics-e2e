import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manlift_app/feature/belt/pages/belt.page.dart';
import 'package:manlift_app/feature/cage/pages/cage.page.dart';
import 'package:manlift_app/util/navigate.dart';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> pages = [
    CagePage(),
    BeltPage(),
  ];

  final List<String> pageName = [
    'Cage Manlift',
    'Belt Manlift',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Manlift Form',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                    itemCount: 2,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 20,
                      mainAxisExtent: MediaQuery.of(context).size.height * 0.25,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          moveTo(context, pages[index]);
                        },
                        child: Card(
                          child: Center(
                            child: Text(
                              pageName[index],
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 50),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              // ElevatedButton(
              //   onPressed: () async {
              //     // PdfDocument document = PdfDocument();

              //     // beltModel.toMap().forEach((u, v) {
              //     //   if (v != null) {
              //     //     document.pages.add().graphics.drawString(
              //     //         v, PdfStandardFont(PdfFontFamily.helvetica, 20),
              //     //         brush: PdfBrushes.black,
              //     //         bounds: const Rect.fromLTWH(10, 10, 300, 50));
              //     //   }
              //     // });
              //     // document.pages.add().graphics.drawString(
              //     //     'Hello Worldjdjdjdj',
              //     //     PdfStandardFont(PdfFontFamily.helvetica, 20),
              //     //     brush: PdfBrushes.black,
              //     //     bounds: const Rect.fromLTWH(10, 10, 300, 50));
              //     // List<int> bytes = await document.save();
              //     // document.dispose();

              //     // final directory =
              //     //     await getApplicationDocumentsDirectory();
              //     // // final directory =
              //     // //     Directory("/storage/emulated/0/Download");
              //     // final path = directory.path;
              //     // print(path);

              //     // await Directory(path).create(recursive: true);

              //     // File file = File('$path/output.pdf');
              //     // print(await file.exists());

              //     // await file.writeAsBytes(bytes, flush: true);
              //     // // await file.writeAsString('12333dsklm');

              //     // // OpenFile.open('$path/Output.pdf');
              //     // var status = await Permission.storage.status;
              //     // if (!status.isGranted) {
              //     //   status = await Permission.storage.request();
              //     // } else {
              //     //   openAppSettings();
              //     // }
              //     // print(status);

              //     // if (status == PermissionStatus.denied) {
              //     //   var status = await Permission.videos.request();
              //     // } else {
              //     //   openAppSettings();
              //     // }
              //     // var status = await Permission.storage.request();
              //     // print(status);
              //     // openAppSettings();
              //     // if (status.isGranted) {
              //     final font =
              //         await rootBundle.load("assets/OpenSans-Bold.ttf");
              //     final ttf = pw.Font.ttf(font);
              //     final pdf = pw.Document();

              //     pdf.addPage(pw.Page(
              //         pageFormat: PdfPageFormat.a4,
              //         build: (pw.Context context) {
              //           return pw.Center(
              //             child: pw.Text(
              //               "jknasfkjasbfjdsf sdbfkjkfnaskflj",
              //               // style: pw.TextStyle(font: ttf, fontSize: 40),
              //             ),
              //           );
              //         }));
              //     final output = await getExternalStorageDirectory();
              //     final directory = Directory("/storage/emulated/0/Download");
              //     final path = directory.path;
              //     print(path);

              //     await Directory(path).create(recursive: true);
              //     final file = File("${path}/example.pdf");
              //     await file.writeAsBytes(await pdf.save());
              //     // }

              //     // await FileSaver.instance.saveFile(name: "output");
              //   },
              //   child: const Text("Button"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
