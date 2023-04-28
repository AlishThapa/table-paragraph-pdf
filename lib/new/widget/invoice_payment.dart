import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import '../util/pdfexport.dart';
import 'padded_text.dart';

Widget invoicePayment(context, invoice) => Column(
      children: [
        Table(
          border: TableBorder.all(color: PdfColors.black),
          children: [
            // The first row just contains a phrase 'INVOICE FOR PAYMENT'
            TableRow(
              children: [
                Padding(
                  child: Text(
                    'INVOICE FOR PAYMENT',
                    style: Theme.of(context).header4,
                    textAlign: TextAlign.center,
                  ),
                  padding: const EdgeInsets.all(20),
                ),
              ],
            ),
            // The remaining rows contain each item from the invoice, and uses the
            // map operator (the ...) to include these items in the list
            ...invoice.items.map(
              // Each new line item for the invoice should be rendered on a new TableRow
              (e) => TableRow(
                children: [
                  // We can use an Expanded widget, and use the flex parameter to specify
                  // how wide this particular widget should be. With a flex parameter of
                  // 2, the description widget will be 66% of the available width.
                  Expanded(
                    child: paddedText(e.description),
                    flex: 2,
                  ),
                  // Again, with a flex parameter of 1, the cost widget will be 33% of the
                  // available width.
                  Expanded(
                    child: paddedText("\$${e.cost}"),
                    flex: 1,
                  )
                ],
              ),
            ),
            // After the itemized breakdown of costs, show the tax amount for this invoice
            // In this case, it's just 10% of the invoice amount
            TableRow(
              children: [
                paddedText('TAX', align: TextAlign.right),
                paddedText('\$${(invoice.totalCost() * 0.1).toStringAsFixed(2)}'),
              ],
            ),
            // Show the total
            TableRow(
              children: [
                paddedText('TOTAL', align: TextAlign.right),
                paddedText("\$${invoice.totalCost()}"),
              ],
            )
          ],
        ),
        Padding(
          child: Text(
            "THANK YOU FOR YOUR BUSINESS!",
            style: Theme.of(context).header2,
          ),
          padding: const EdgeInsets.all(20),
        ),
      ],
    );
