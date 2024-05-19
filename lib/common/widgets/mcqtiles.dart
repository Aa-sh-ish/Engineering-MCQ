import 'package:engineering_mcq/common/utils/constants.dart';
import 'package:engineering_mcq/common/widgets/appstyle.dart';
import 'package:engineering_mcq/common/widgets/reusabletext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MCQTile extends StatelessWidget {
  const MCQTile({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      decoration: BoxDecoration(
          color: AppConst.kLight,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppConst.knavypurple3)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ReusableText(
          height: 60,
          width: double.infinity,
          text: text,
          textstyle: appstyle(15, AppConst.knavypurple4, FontWeight.w600),
        ),
      ),
    );
  }
}
