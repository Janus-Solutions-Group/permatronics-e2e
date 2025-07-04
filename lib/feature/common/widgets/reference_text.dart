import 'package:pdf/widgets.dart' as pw;

pw.Column referenceText(List<Map<String, dynamic>> list, String title) {
  return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
    pw.Text(
      title,
      style: pw.TextStyle(
        fontSize: 16,
        fontWeight: pw.FontWeight.bold,
      ),
    ),
    pw.SizedBox(height: 10),
    ...List.generate(
        list.length,
        (i) => pw.Padding(
              padding: const pw.EdgeInsets.only(bottom: 10),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    list[i]['title'],
                    style: pw.TextStyle(
                      fontSize: 12,
                      fontWeight: pw.FontWeight.normal,
                    ),
                  ),
                  pw.Text(
                    list[i]['value'],
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            )),
    pw.SizedBox(height: 20),
  ]);
}
