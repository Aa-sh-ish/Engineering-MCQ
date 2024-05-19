import 'package:engineering_mcq/common/utils/constants.dart';
import 'package:engineering_mcq/common/widgets/appstyle.dart';
import 'package:engineering_mcq/common/widgets/reusabletext.dart';
import 'package:flutter/material.dart';

class ExamLoadingErrorState extends StatelessWidget {
  const ExamLoadingErrorState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConst.kHeight,
      width: AppConst.kWidth,
      child: Center(
        child: ReusableText(
          text: "Error Getting Your Exam Try again Later",
          textstyle: appstyle(40, Colors.red, FontWeight.w500),
          height: 200,
          width: double.infinity,
        ),
      ),
    );
  }
}
