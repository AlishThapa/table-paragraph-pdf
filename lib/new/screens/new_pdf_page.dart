import 'package:flutter/material.dart';

import '../widget/invoice/invoices.dart';
import 'detail_page.dart';

class NewPdfPage extends StatefulWidget {
  const NewPdfPage({Key? key}) : super(key: key);

  @override
  State<NewPdfPage> createState() => _NewPdfPageState();
}

class _NewPdfPageState extends State<NewPdfPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffBF9AFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffBF9AFF),
        title: const Text(
          'Invoices',
        ),
      ),
      body: ListView(
        children: [
          ...invoices.map(
            (e) => Card(
              color: const Color(0xff8EF2F5),
              elevation: 5,
              child: ListTile(
                title: Text(e.name),
                subtitle: Text(e.customer),
                trailing: Text('\$${e.totalCost().toStringAsFixed(2)}'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (builder) => DetailPage(invoice: e),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
