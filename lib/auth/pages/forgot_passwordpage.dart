import 'package:engineering_mcq/auth/blocs/forgot_pass_blocs/forgot_pass_bloc.dart';
import 'package:engineering_mcq/common/utils/constants.dart';
import 'package:engineering_mcq/common/widgets/appstyle.dart';
import 'package:engineering_mcq/common/widgets/heightspacer.dart';
import 'package:engineering_mcq/common/widgets/outlinebutton.dart';
import 'package:engineering_mcq/common/widgets/reusabletext.dart';
import 'package:engineering_mcq/common/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class ForgotPassswordPage extends StatelessWidget {
  ForgotPassswordPage({super.key});

  final TextEditingController emailComtroller = TextEditingController();
  final TextEditingController otpComtroller = TextEditingController();
  final TextEditingController newPAssWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<ForgotPassBloc, ForgotPassState>(
        listener: (context, state) {
          if (state is LoginCodeSentErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: AppConst.kred, content: Text(state.error)));
          }
          if (state is PinMissMatchState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: AppConst.kred, content: Text(state.error)));
          }
          if (state is PasswordChangeErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: AppConst.kred, content: Text(state.error)));
          }
          if (state is PasswordChangedState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: AppConst.kGreen,
                content: Text(state.message)));
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/splashScreen', (Route<dynamic> route) => false);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                HeightSpace(height: 15.h),
                SizedBox(
                  height: 200.h,
                  width: AppConst.kWidth,
                  child: Image.asset(
                    "assets/Logo.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                HeightSpace(height: 20.h),
                ReusableText(
                  text: "Reset Your Password",
                  textstyle:
                      appstyle(24, AppConst.knavypurple4, FontWeight.w500),
                ),
                HeightSpace(height: 10.h),
                CustomeTextField(
                    hintText: "Enter Your Email", controller: emailComtroller),
                HeightSpace(height: 10.h),
                if (state is LogingcodeLoadingState)
                  SizedBox(
                    height: 50.h,
                    width: 50.w,
                    child: const CircularProgressIndicator(
                      color: AppConst.knavypurple4,
                    ),
                  ),
                Visibility(
                  visible: (state is ForgotPassInitial) ? true : false,
                  child: CustomOutlineButton(
                      ontap: () {
                        BlocProvider.of<ForgotPassBloc>(context)
                            .add(CodeRequestEvent(email: emailComtroller.text));
                      },
                      width: 100,
                      height: 40,
                      borradius: 15,
                      borcolor: AppConst.knavypurple4,
                      text: "Sent OTP",
                      textstyle:
                          appstyle(25, AppConst.knavypurple3, FontWeight.w500),
                      textheight: 30,
                      textwidth: 70),
                ),
                Visibility(
                  visible: (state is LoginCodeSentState ||
                          state is PinMissMatchState)
                      ? true
                      : false,
                  child: Column(
                    children: [
                      ReusableText(
                        text: "Enter Your Pin",
                        textstyle: appstyle(
                            18, AppConst.knavypurple4, FontWeight.w500),
                        width: 200,
                        height: 30.h,
                      ),
                      Pinput(
                        controller: otpComtroller,
                        autofocus: false,
                        length: 5,
                        onCompleted: (val) {},
                      ),
                      HeightSpace(height: 10.h),
                      CustomOutlineButton(
                          ontap: () {
                            BlocProvider.of<ForgotPassBloc>(context).add(
                              PinSendEnterEvent(pin: otpComtroller.text),
                            );
                          },
                          width: 100,
                          height: 40,
                          borradius: 15,
                          borcolor: AppConst.kGreen,
                          text: "Verify",
                          textstyle:
                              appstyle(25, AppConst.kGreen, FontWeight.w500),
                          textheight: 30,
                          textwidth: 70),
                    ],
                  ),
                ),
                Visibility(
                  visible: (state is PinMatchState ||
                          state is PasswordChangeLoadingState ||
                          state is PasswordChangeErrorState ||
                          state is PaswordInvalidState)
                      ? true
                      : false,
                  child: Column(
                    children: [
                      CustomeTextField(
                          hintText: "Enter Your New Password",
                          controller: newPAssWordController),
                      HeightSpace(height: 10.h),
                      if (state is PasswordChangeLoadingState)
                        SizedBox(
                          height: 50.h,
                          width: 50.w,
                          child: const CircularProgressIndicator(
                            color: AppConst.knavypurple4,
                          ),
                        ),
                      Visibility(
                        visible: (state is PasswordChangeLoadingState)
                            ? false
                            : true,
                        child: CustomOutlineButton(
                            ontap: () {
                              BlocProvider.of<ForgotPassBloc>(context).add(
                                  PasswordChangeRequestEvent(
                                      newPassword: newPAssWordController.text,
                                      email: emailComtroller.text));
                            },
                            width: 100,
                            height: 40,
                            borradius: 15,
                            borcolor: AppConst.kGreen,
                            text: "Submit",
                            textstyle:
                                appstyle(25, AppConst.kGreen, FontWeight.w500),
                            textheight: 30,
                            textwidth: 70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
