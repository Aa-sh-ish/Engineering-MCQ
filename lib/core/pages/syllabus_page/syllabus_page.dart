import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SyllabusPage extends StatelessWidget {
  const SyllabusPage({super.key, required this.syllabsApi});
  final String syllabsApi;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        color: Colors.blue,
      )
          //  SfPdfViewer.network(
          //   syllabsApi,
          //   enableDocumentLinkAnnotation: true,
          // ),
          ),
    );
  }
}
