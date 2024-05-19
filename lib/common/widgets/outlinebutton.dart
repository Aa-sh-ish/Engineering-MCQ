import 'package:engineering_mcq/common/widgets/reusabletext.dart';
import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    this.ontap,
    required this.width,
    required this.height,
    required this.borradius,
    this.color,
    required this.borcolor,
    required this.text,
    required this.textstyle,
    required this.textheight,
    required this.textwidth,
  });

  final Function()? ontap;
  final double width;
  final double height;
  final double borradius;
  final Color? color;
  final Color borcolor;
  final String text;
  final TextStyle textstyle;
  final double textheight;
  final double textwidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(borradius),
            ),
            border: Border.all(width: 1, color: borcolor)),
        child: Center(
            child: ReusableText(
          text: text,
          textstyle: textstyle,
          height: textheight,
          width: textwidth,
        )),
      ),
    );
  }
}
