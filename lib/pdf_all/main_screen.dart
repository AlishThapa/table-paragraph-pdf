import 'package:flutter/material.dart';
import 'package:pdf_learn/new/screens/new_pdf_page.dart';
import 'package:pdf_learn/pdf_all/screen/pdf_screen.dart';
import 'package:pdf_learn/pdf_all/widget/button_widget.dart';

import '../main.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(MyApp.title),
          centerTitle: true,
          backgroundColor: Colors.tealAccent.shade200,
        ),
        body: Container(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  text: 'Paragraph PDF',
                  onClicked: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PdfPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 15),
                ButtonWidget(
                  text: 'NewPdfPage',
                  onClicked: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewPdfPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      );
}
