import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ImagePickingWidget extends StatefulWidget {
  const ImagePickingWidget(
      {super.key, required this.pageController, this.beltModel});
  final PageController pageController;
  final BeltInspection? beltModel;

  @override
  State<ImagePickingWidget> createState() => _ImagePickingWidgetState();
}

class _ImagePickingWidgetState extends State<ImagePickingWidget> {
  List<File> imagelist = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      imagelist.add(File(pickedFile.path));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const Text(
            'Form Image List',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              _pickImage(ImageSource.gallery);
            },
            child: const Text('Pick From Gallery'),
          ),
          const SizedBox(height: 30),
          if (imagelist.isEmpty)
            const Center(
              child: Text(
                "No Image Selected",
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
            ),
          Expanded(
            child: ListView.separated(
              itemCount: imagelist.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Image.file(imagelist[index]),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: IconButton(
                          onPressed: () {
                            imagelist.removeAt(index);
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.cancel,
                            size: 40,
                            color: Colors.green,
                          )),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 15),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PageNavigationButton(
                pageController: widget.pageController,
                right: false,
              ),
              ElevatedButton(
                onPressed: () async {
                  // PdfDocument document = PdfDocument();

                  // document.pages.add().graphics.drawString(
                  //     'Hello Worldjdjdjdj',
                  //     PdfStandardFont(PdfFontFamily.helvetica, 20),
                  //     brush: PdfBrushes.black,
                  //     bounds: const Rect.fromLTWH(10, 10, 300, 50));
                  // List<int> bytes = await document.save();
                  // document.dispose();

                  // final directory =
                  //     await getApplicationDocumentsDirectory();
                  // // final directory =
                  // //     Directory("/storage/emulated/0/Download");
                  // final path = directory.path;
                  // print(path);

                  // await Directory(path).create(recursive: true);

                  // File file = File('$path/output.pdf');
                  // print(await file.exists());

                  // await file.writeAsBytes(bytes, flush: true);
                  // // await file.writeAsString('12333dsklm');

                  // // OpenFile.open('$path/Output.pdf');
                  // var status = await Permission.storage.status;
                  // if (!status.isGranted) {
                  //   status = await Permission.storage.request();
                  // } else {
                  //   openAppSettings();
                  // }
                  // print(status);

                  // if (status == PermissionStatus.denied) {
                  //   var status = await Permission.videos.request();
                  // } else {
                  //   openAppSettings();
                  // }
                  // var status = await Permission.storage.request();
                  // print(status);
                  // openAppSettings();
                  // if (status.isGranted) {
                  // final font =
                  //     await rootBundle.load("assets/OpenSans-Bold.ttf");
                  // final ttf = pw.Font.ttf(font);
                  List<String> list = [];
                  // for (int i = 0; i < 1000; i++) list.add("asdfg$i");
                  widget.beltModel!.toMap().forEach((u, v) {
                    if (v != null) {
                      list.add(v.toString());
                    }
                  });

                  // await generatePdf(list);
                  final pdf = pw.Document();

                  pdf.addPage(pw.Page(
                      pageFormat: PdfPageFormat.a4,
                      build: (pw.Context context) {
                        return pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: List.generate(
                                list.length, (index) => pw.Text(list[index])));
                      }));
                  // final output = await getExternalStorageDirectory();
                  final directory = Directory("/storage/emulated/0/Download");
                  final path = directory.path;
                  print(path);

                  await Directory(path).create(recursive: true);
                  final file = File("${path}/output.pdf");
                  await file.writeAsBytes(await pdf.save());

                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('pdf is created')));
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  Future<void> generatePdf(List<String> dataList) async {
    final pdf = pw.Document();
    const pageMargin = 20.0; // Margin from all sides

    double yOffset = pageMargin; // Track current Y position on the page
    double availableHeight = PdfPageFormat.a4.height - (2 * pageMargin);

    final page = pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.all(pageMargin),
      build: (context) => pw.Container(),
    );

    void addNewPage() {
      yOffset = pageMargin;
      pdf.addPage(page);
    }

    // Example data that we're adding

    for (final data in dataList) {
      final text = pw.Text(data);
      final TextPainter textPainter = TextPainter(
        text: TextSpan(text: data),
        textDirection: TextDirection.ltr,
      )..layout(minWidth: 0, maxWidth: double.infinity);
      print(textPainter.size.height);
      final textHeight = textPainter.size.height;
      if (yOffset + textHeight > availableHeight) {
        addNewPage();
      }

      // Add content to current page
      pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(pageMargin),
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(data),
            ],
          );
        },
      ));

      yOffset += textHeight;
    }

    // Save the PDF
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/output.pdf");
    await file.writeAsBytes(await pdf.save());
  }
}
