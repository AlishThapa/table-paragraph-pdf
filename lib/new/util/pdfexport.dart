import 'dart:math';

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';

import 'package:pdf/widgets.dart';
import 'package:pdf_learn/new/models/new_pdf.dart';

import '../widget/invoice_payment.dart';
import '../widget/padded_text.dart';

Future<Uint8List> makePdf(Invoice invoice) async {
  final imageLogo = MemoryImage((await rootBundle.load('assets/images/technical_logo.png')).buffer.asUint8List());
  final pdf = Document();
  pdf.addPage(
    Page(
      build: (context) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Attention to: ${invoice.customer}"),
                    Text(invoice.address),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image(imageLogo),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),

            /// =========================================== UPPER TABLE =======================================================

            invoicePayment(context, invoice),

            // Table(
            //   border: TableBorder.all(color: PdfColors.black),
            //   children: [
            //     // The first row just contains a phrase 'INVOICE FOR PAYMENT'
            //     TableRow(
            //       children: [
            //         Padding(
            //           child: Text(
            //             'INVOICE FOR PAYMENT',
            //             style: Theme.of(context).header4,
            //             textAlign: TextAlign.center,
            //           ),
            //           padding: const EdgeInsets.all(20),
            //         ),
            //       ],
            //     ),
            //     // The remaining rows contain each item from the invoice, and uses the
            //     // map operator (the ...) to include these items in the list
            //     ...invoice.items.map(
            //       // Each new line item for the invoice should be rendered on a new TableRow
            //       (e) => TableRow(
            //         children: [
            //           // We can use an Expanded widget, and use the flex parameter to specify
            //           // how wide this particular widget should be. With a flex parameter of
            //           // 2, the description widget will be 66% of the available width.
            //           Expanded(
            //             child: paddedText(e.description),
            //             flex: 2,
            //           ),
            //           // Again, with a flex parameter of 1, the cost widget will be 33% of the
            //           // available width.
            //           Expanded(
            //             child: paddedText("\$${e.cost}"),
            //             flex: 1,
            //           )
            //         ],
            //       ),
            //     ),
            //     // After the itemized breakdown of costs, show the tax amount for this invoice
            //     // In this case, it's just 10% of the invoice amount
            //     TableRow(
            //       children: [
            //         paddedText('TAX', align: TextAlign.right),
            //         paddedText('\$${(invoice.totalCost() * 0.1).toStringAsFixed(2)}'),
            //       ],
            //     ),
            //     // Show the total
            //     TableRow(
            //       children: [
            //         paddedText('TOTAL', align: TextAlign.right),
            //         paddedText("\$${invoice.totalCost()}"),
            //       ],
            //     )
            //   ],
            // ),
            // Padding(
            //   child: Text(
            //     "THANK YOU FOR YOUR BUSINESS!",
            //     style: Theme.of(context).header2,
            //   ),
            //   padding: const EdgeInsets.all(20),
            // ),

            /// =========================================== LOWER TABLE =============================================================

            // summaryInvoice(context, invoice),

            Text("Please forward the below slip to your accounts payable department."),
            // Create a divider that is 1 unit high and make the appearance of
            // the line dashed
            Divider(
              height: 1,
              borderStyle: BorderStyle.dashed,
            ),
            // Space out the invoice appropriately
            SizedBox(height: 50),
            // Create another table with the payment details
            Table(
              border: TableBorder.all(color: PdfColors.black),
              children: [
                TableRow(
                  children: [
                    paddedText('Account Number'),
                    paddedText(
                      generateRandomNumber(),
                    )
                  ],
                ),
                TableRow(
                  children: [
                    paddedText(
                      'Account Name',
                    ),
                    paddedText(
                      invoice.customer,
                    )
                  ],
                ),
                TableRow(
                  children: [
                    paddedText(
                      'Total Amount to be Paid',
                    ),
                    paddedText('\$${(invoice.totalCost() * 1.1).toStringAsFixed(2)}')
                  ],
                )
              ],
            ),
            // Add a final instruction about how checks should be created
            // Center align and italicize this text to draw the reader's attention
            // to it.
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                'Please ensure all checks are payable to the ADAM FAMILY TRUST.',
                style: Theme.of(context).header3.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    ),
  );
  return pdf.save();
}


String generateRandomNumber() {
  Random random = Random();
  String randomNumber = '';
  for (int i = 0; i < 16; i++) {
    if (i % 4 == 0 && i > 0) {
      randomNumber += ' ';
    }
    randomNumber += random.nextInt(10).toString();
  }
  return randomNumber;
}
