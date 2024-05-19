import 'package:engineering_mcq/common/utils/constants.dart';
import 'package:engineering_mcq/common/widgets/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField({
    super.key,
    this.keyboardtype,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.hintstyle,
    required this.controller,
    this.onChanged,
    this.obsecure,
    this.errorText,
  });

  final TextInputType? keyboardtype;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintstyle;
  final bool? obsecure;
  final String? errorText;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: AppConst.kWidth * 0.8,
        height: 50.h,
        decoration: const BoxDecoration(
          color: AppConst.kLight,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: TextField(
          obscureText: obsecure ?? false,
          keyboardType: keyboardtype,
          controller: controller,
          cursorHeight: 20,
          onChanged: onChanged,
          style: appstyle(12, AppConst.kBkDark, FontWeight.w500),
          decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              suffixIconColor: AppConst.kBkDark,
              hintStyle: hintstyle,
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: AppConst.kred, width: 0.5),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide:
                    BorderSide(color: AppConst.knavypurpledark, width: 0.5),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide:
                    BorderSide(color: AppConst.knavypurpledark, width: 0.5),
              ),
              disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: AppConst.kGreyDK, width: 0.5),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: AppConst.kBkDark, width: 0.5),
              )),
        ),
      ),
    );
  }
}
