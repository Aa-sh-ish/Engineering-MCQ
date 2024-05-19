import 'package:engineering_mcq/common/utils/constants.dart';
import 'package:engineering_mcq/common/widgets/appstyle.dart';
import 'package:engineering_mcq/common/widgets/heightspacer.dart';
import 'package:engineering_mcq/common/widgets/reusabletext.dart';
import 'package:flutter/material.dart';

class ExamLoadingState extends StatelessWidget {
  const ExamLoadingState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ReusableText(
            text: "Get Ready For Your Exam",
            textstyle: appstyle(24, AppConst.knavypurple4, FontWeight.w500)),
        const HeightSpace(height: 20),
        SizedBox(
          width: AppConst.kWidth * 0.8,
          child: const LinearProgressIndicator(
            semanticsLabel: "Getting Ready Your Questions",
            backgroundColor: AppConst.kGreen,
            minHeight: 5,
            color: AppConst.kLight,
          ),
        )
      ],
    );
  }
}
