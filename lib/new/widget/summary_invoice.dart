import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf_learn/new/widget/padded_text.dart';

Widget summaryInvoice(context, invoice) => Column(
      children: [
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
                  '1234 1234',
                )
              ],
            ),
            TableRow(
              children: [
                paddedText(
                  'Account Name',
                ),
                paddedText(
                  'ADAM FAMILY TRUST',
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
        )
      ],
    );
