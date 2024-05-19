import 'package:engineering_mcq/common/utils/constants.dart';
import 'package:engineering_mcq/common/widgets/appstyle.dart';
import 'package:engineering_mcq/common/widgets/reusabletext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionBox extends StatelessWidget {
  const SubscriptionBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                  text: "Premium Exams",
                  height: 20,
                  width: 200,
                  textstyle:
                      appstyle(15, AppConst.knavypurpledark, FontWeight.bold)),
            ),
            CircleAvatar(
              radius: 50,
              child: Image.asset("assets/Premium_Exam_Logo.png"),
            )
          ],
        ),
      ),
    );
  }
}
