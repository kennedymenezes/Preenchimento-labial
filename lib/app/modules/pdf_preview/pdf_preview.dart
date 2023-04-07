import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import '../../domain/app/util/pdf_generete.dart';

class PdfPreviewPage extends StatefulWidget {
  const PdfPreviewPage({
    Key? key,

  }) : super(key: key);

  @override
  State<PdfPreviewPage> createState() => _PdfPreviewPageState();
}

class _PdfPreviewPageState extends State<PdfPreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          "PDF CRIADO",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: PdfPreview(
        canDebug: false,

        build: (context) => GeneratePdf.generatePdf(),
      ),
    );
  }
}
