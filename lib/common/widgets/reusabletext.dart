import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  const ReusableText({
    super.key,
    required this.text,
    required this.textstyle,
    this.height,
    this.width,
  });

  final String text;
  final double? height;
  final double? width;
  final TextStyle textstyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: AutoSizeText(
          text,
          textAlign: TextAlign.left,
          overflow: TextOverflow.fade,
          style: textstyle,
        ),
      ),
    );
  }
}
