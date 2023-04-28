import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf_learn/pdf_all/util/url_text.dart';
import 'package:pdf_learn/pdf_all/util/category.dart';
import 'package:pdf_learn/pdf_all/util/paragraph_body.dart';
import 'package:pdf_learn/pdf_all/widget/container_top.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> saveAsFile(
  final BuildContext context,
  final LayoutCallback build,
  final PdfPageFormat pageFormat,
) async {
  final bytes = await build(pageFormat);
  final appDocDirectory = await getApplicationDocumentsDirectory();
  final appDocPath = appDocDirectory.path;
  final file = File('$appDocPath/document.pdf');
  print('save as file ${file.path}');
  await file.writeAsBytes(bytes);
  await OpenFile.open(file.path);
}

Future<Uint8List> generatedPdf(final PdfPageFormat format) async {
  final doc = pw.Document(title: 'Alish');
  final logoImage = pw.MemoryImage(
    (await rootBundle.load(
      'assets/images/img.jpg',
    ))
        .buffer
        .asUint8List(),
  );
  final footerImage = pw.MemoryImage(
    (await rootBundle.load(
      'assets/images/footer.jpg',
    ))
        .buffer
        .asUint8List(),
  );

  final font = await rootBundle.load('assets/fonts/OpenSans-Italic.ttf');
  final ttf = pw.Font.ttf(font);

  final pageTheme = await _myPageTheme(format);

  doc.addPage(
    pw.MultiPage(
      pageTheme: pageTheme,
      header: (final context) => pw.Image(
        alignment: pw.Alignment.topLeft,
        logoImage,
        fit: pw.BoxFit.contain,
        width: 100,
      ),
      footer: (final context) => pw.Image(
        footerImage,
        fit: pw.BoxFit.scaleDown,
      ),
      build: (final context) => [
        ContainerTop(),
        pw.Center(
          child: pw.Text(
            'Chat Bhai(Chat GPT)',
            textAlign: pw.TextAlign.center,
            style: pw.TextStyle(
              font: ttf,
              fontSize: 30,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ),
        pw.Align(
          alignment: pw.Alignment.centerLeft,
          child: Category(
            'Flutter Pdf',
            ttf,
          ),
        ),
        pw.Paragraph(
          text: bodyText,
          margin: const pw.EdgeInsets.only(top: 10),
          style: pw.TextStyle(
            font: ttf,
            lineSpacing: 8,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
  return doc.save();
}

Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
  final logoImage = pw.MemoryImage(
    (await rootBundle.load(
      'assets/images/img.jpg',
    ))
        .buffer
        .asUint8List(),
  );
  return pw.PageTheme(
    margin: const pw.EdgeInsets.symmetric(
      horizontal: 1 * PdfPageFormat.cm,
      vertical: 0.5 * PdfPageFormat.cm,
    ),
    textDirection: pw.TextDirection.ltr,
    orientation: pw.PageOrientation.portrait,
    buildBackground: (final context) => pw.FullPage(
      ignoreMargins: true,
      child: pw.Watermark(
        angle: 20,
        child: pw.Opacity(
          opacity: 0.5,
          child: pw.Image(
            alignment: pw.Alignment.center,
            logoImage,
            fit: pw.BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}

void showPrintedToast(final BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Successfully Printed'),
    ),
  );
}

void showSharedToast(final BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Successfully Shared'),
    ),
  );
}
