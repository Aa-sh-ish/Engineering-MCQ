import 'package:engineering_mcq/common/utils/constants.dart';
import 'package:engineering_mcq/common/widgets/appstyle.dart';
import 'package:engineering_mcq/common/widgets/outlinebutton.dart';
import 'package:engineering_mcq/common/widgets/reusabletext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> logOutAlertDialogue(
  context,
  void add,
) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: ReusableText(
          text: "Are You Sure You Want To Log Out ? ",
          textstyle: appstyle(30, AppConst.knavypurpledark, FontWeight.w500),
          height: 30.h,
          width: 40.w,
        ),
        actions: <Widget>[
          CustomOutlineButton(
            width: 100.w,
            height: 50.h,
            borradius: 25.h,
            borcolor: AppConst.kGreen,
            color: AppConst.kGreen,
            text: "Cancel",
            textstyle: appstyle(20, AppConst.kLight, FontWeight.bold),
            textheight: 25,
            textwidth: 600,
            ontap: () {
              Navigator.pop(context);
            },
          ),
          CustomOutlineButton(
              width: 100.w,
              height: 50.h,
              borradius: 25.h,
              borcolor: Colors.red,
              color: Colors.red,
              text: "Log Out",
              textstyle: appstyle(20, AppConst.kLight, FontWeight.bold),
              textheight: 25,
              textwidth: 600,
              ontap: () {
                add;
              })
        ],
      );
    },
  );
}
