import 'package:engineering_mcq/common/utils/constants.dart';
import 'package:engineering_mcq/common/widgets/appstyle.dart';
import 'package:engineering_mcq/common/widgets/reusabletext.dart';
import 'package:engineering_mcq/core/pages/landingpage/widgets/modelquestionselectdialoguebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModelQuestionBox extends StatelessWidget {
  const ModelQuestionBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        modelQuestionSelectDialogue(context);
      },
      child: Container(
        width: 150.w,
        height: 150.h,
        decoration: BoxDecoration(
          color: AppConst.kLight,
          boxShadow: const [
            BoxShadow(
              color: AppConst.knavypurple2,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          border: Border.all(width: 2, color: AppConst.knavypurplelight),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReusableText(
                  text: "Model Questions",
                  height: 20.h,
                  width: 120.w,
                  textstyle:
                      appstyle(20, AppConst.knavypurpledark, FontWeight.bold)),
            ),
            CircleAvatar(
              radius: 50,
              child: Image.asset("assets/Model_Question_Logo.jpg"),
            ),
          ],
        ),
      ),
    );
  }
}
