import 'package:flutter/material.dart';
import 'package:pdf_learn/new/util/pdfexport.dart';
import 'package:printing/printing.dart';

import '../models/new_pdf.dart';

class PdfPreviewPage extends StatelessWidget {
  final Invoice invoice;

  const PdfPreviewPage({Key? key, required this.invoice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PDF Preview',
        ),
      ),
      body: PdfPreview(
        build: (context) => makePdf(invoice),
      ),
    );
  }
}
