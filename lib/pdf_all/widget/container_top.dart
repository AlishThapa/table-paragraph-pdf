import 'package:pdf/widgets.dart' as pw;

import '../util/url_text.dart';

class ContainerTop extends pw.StatelessWidget {
  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      padding: const pw.EdgeInsets.only(
        left: 30,
        bottom: 20,
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        mainAxisAlignment: pw.MainAxisAlignment.start,
        children: [
          pw.Padding(
            padding: const pw.EdgeInsets.only(top: 20),
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text('Phone: '),
                  pw.Text('Email: '),
                  pw.Text('Instagram: '),
                  pw.Text('Twitter: '),
                ],
              ),
              pw.SizedBox(width: 70),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text('0012 345 6789'),
                  pw.SizedBox(height: 10),
                  UrlText(
                    text: 'Alish Thapa',
                    url: 'alish.thapa.4450@gmail.com',
                  ),
                  UrlText(
                    text: 'Flutter PDF',
                    url: '@flutterPdf',
                  ),
                ],
              ),
              pw.SizedBox(width: 70),
              pw.BarcodeWidget(
                data: 'Flutter Pdf',
                width: 40,
                height: 40,
                barcode: pw.Barcode.qrCode(),
                drawText: false,
              ),
              pw.Padding(
                padding: pw.EdgeInsets.zero,
              )
            ],
          )
        ],
      ),
    );
  }
}
