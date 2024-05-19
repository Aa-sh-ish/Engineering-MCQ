import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ModelQuestionPage extends StatelessWidget {
  const ModelQuestionPage({super.key, required this.modelQuestionApi});
  final String modelQuestionApi;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        color: Colors.red,
      )
          // SfPdfViewer.network(
          //   modelQuestionApi,
          //   enableDocumentLinkAnnotation: true,
          // ),
          ),
    );
  }
}
