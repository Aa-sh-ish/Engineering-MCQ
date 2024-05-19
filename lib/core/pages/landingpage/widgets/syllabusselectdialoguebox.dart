import 'package:engineering_mcq/common/utils/constants.dart';
import 'package:engineering_mcq/common/widgets/appstyle.dart';
import 'package:engineering_mcq/common/widgets/heightspacer.dart';
import 'package:engineering_mcq/common/widgets/outlinebutton.dart';
import 'package:engineering_mcq/common/widgets/reusabletext.dart';
import 'package:engineering_mcq/core/repossitories/api/syllabus.api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> syllabusSelectDialogue(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: ReusableText(
          text: "Choose Your faculty",
          textstyle: appstyle(30, AppConst.knavypurpledark, FontWeight.bold),
          height: 30.h,
          width: 40.w,
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              CustomOutlineButton(
                ontap: () {
                  Navigator.popAndPushNamed(context, "/syllabus", arguments: {
                    "syllabusApi": SyllabusApi.computerEngineeringSyllabus(),
                  });
                },
                width: 300.w,
                height: 50.h,
                borradius: 25.h,
                borcolor: AppConst.knavypurpledark,
                text: "Computer Engineering",
                textstyle:
                    appstyle(24, AppConst.knavypurpledark, FontWeight.bold),
                textheight: 20,
                textwidth: 600,
              ),
              const HeightSpace(height: 10),
              CustomOutlineButton(
                ontap: () {
                  Navigator.popAndPushNamed(context, "/syllabus", arguments: {
                    "syllabusApi": SyllabusApi.civilEngineeringSyllabus(),
                  });
                },
                width: 300.w,
                height: 50.h,
                borradius: 25.h,
                borcolor: AppConst.knavypurpledark,
                text: "Civil Engineering",
                textstyle:
                    appstyle(24, AppConst.knavypurpledark, FontWeight.bold),
                textheight: 20,
                textwidth: 600,
              ),
              const HeightSpace(height: 10),
              CustomOutlineButton(
                ontap: () {
                  Navigator.popAndPushNamed(context, "/syllabus", arguments: {
                    "syllabusApi": SyllabusApi
                        .electrnoiceAndCommunicationEngineeringSyllabus(),
                  });
                },
                width: 300.w,
                height: 50.h,
                borradius: 25.h,
                borcolor: AppConst.knavypurpledark,
                text: "Electronics & COM. Engineering",
                textstyle:
                    appstyle(24, AppConst.knavypurpledark, FontWeight.bold),
                textheight: 20,
                textwidth: 600,
              ),
              const HeightSpace(height: 10),
              CustomOutlineButton(
                ontap: () {
                  Navigator.popAndPushNamed(context, "/syllabus", arguments: {
                    "syllabusApi": SyllabusApi.mechanicalEngineeringSyllabus(),
                  });
                },
                width: 300.w,
                height: 50.h,
                borradius: 25.h,
                borcolor: AppConst.knavypurpledark,
                text: "Mechanical Engineering",
                textstyle:
                    appstyle(30, AppConst.knavypurpledark, FontWeight.bold),
                textheight: 20,
                textwidth: 600,
              )
            ],
          ),
        ),
        actions: <Widget>[
          CustomOutlineButton(
            width: 100.w,
            height: 50.h,
            borradius: 25.h,
            borcolor: Colors.red,
            color: Colors.red,
            text: "Cancel",
            textstyle: appstyle(30, AppConst.kLight, FontWeight.bold),
            textheight: 25,
            textwidth: 600,
            ontap: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}
