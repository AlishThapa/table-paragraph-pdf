import 'package:flutter/material.dart';
import 'package:pdf_learn/new/screens/pdf_preview_page.dart';
import '../models/new_pdf.dart';

class DetailPage extends StatelessWidget {
  final Invoice invoice;

  const DetailPage({
    Key? key,
    required this.invoice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffBF9AFF),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PdfPreviewPage(invoice: invoice),
            ),
          );
        },
        child: const Icon(Icons.picture_as_pdf),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xffBF9AFF),
        elevation: 2,
        title: Text(invoice.name),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              color: const Color(0xff8EF2F5),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Customer',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        invoice.customer,
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              color: const Color(0xff8EF2F5),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  children: [
                    Text(
                      'Invoice Items',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    ...invoice.items.map(
                      (e) => ListTile(
                        title: Text(e.description),
                        trailing: Text(
                          e.cost.toStringAsFixed(2),
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    DefaultTextStyle.merge(
                      style: Theme.of(context).textTheme.titleMedium,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Total",
                            ),
                            const Spacer(),
                            Text(
                              invoice.totalCost().toStringAsFixed(2),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
