// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/pages/belt.page.dart';
import 'package:manlift_app/feature/cage/pages/cage.page.dart';
import 'package:manlift_app/util/navigate.dart';

// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:syncfusion_flutter_pdf/pdf.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;

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
              //     List<String> l = [];
              //     for (int i = 0; i < 1000; i++) {
              //       l.add("asd$i");
              //     }

              //     // await generatePdf(list);
              //     final pdf = pw.Document();

              //     pdf.addPage(pw.MultiPage(
              //         pageFormat: PdfPageFormat.a4,
              //         build: (pw.Context context) {
              //           return List.generate(
              //               l.length, (index) => pw.Text(l[index]));
              //         }));
              //     // final output = await getExternalStorageDirectory();
              //     final directory = Directory("/storage/emulated/0/Download");
              //     final path = directory.path;
              //     print(path);

              //     await Directory(path).create(recursive: true);
              //     final file = File("${path}/output.pdf");
              //     await file.writeAsBytes(await pdf.save());

              //     if (context.mounted) {
              //       ScaffoldMessenger.of(context).showSnackBar(
              //           const SnackBar(content: Text('pdf is created')));
              //     }
              //   },
              //   child: const Text("Create"),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
