import 'package:engineering_mcq/auth/blocs/loginblocs/login_blocs.dart';
import 'package:engineering_mcq/auth/blocs/loginblocs/login_events.dart';
import 'package:engineering_mcq/auth/blocs/loginblocs/login_state.dart';
import 'package:engineering_mcq/common/utils/constants.dart';
import 'package:engineering_mcq/common/widgets/appstyle.dart';
import 'package:engineering_mcq/common/widgets/heightspacer.dart';
import 'package:engineering_mcq/common/widgets/outlinebutton.dart';
import 'package:engineering_mcq/common/widgets/reusabletext.dart';
import 'package:engineering_mcq/common/widgets/textfield.dart';
import 'package:engineering_mcq/common/widgets/widthspacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<LoginBlocs, LoginState>(
        listener: (context, state) {
          if (state is LoggedInstate) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/landingPage', (Route<dynamic> route) => false);
          }
        },
        builder: (context, state) {
          if (state is ReLoggingLoadingState) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset("assets/Logo.png"),
                    ),
                    SizedBox(
                      width: AppConst.kWidth * 0.8,
                      child: const LinearProgressIndicator(
                        backgroundColor: AppConst.kGreen,
                        minHeight: 5,
                        color: AppConst.kLight,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            body: ListView(
              children: [
                Column(
                  children: [
                    HeightSpace(height: 15.h),
                    SizedBox(
                      height: 200,
                      width: AppConst.kWidth,
                      child: Image.asset(
                        "assets/Logo.png",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    HeightSpace(height: 20.h),
                    CustomeTextField(
                      onChanged: (val) {
                        BlocProvider.of<LoginBlocs>(context).add(
                          EmailChangeEvent(emailController.text),
                        );
                      },
                      prefixIcon: const Icon(
                        Icons.person,
                        color: AppConst.knavypurple4,
                      ),
                      hintText: "Enter Your Email",
                      controller: emailController,
                    ),
                    BlocBuilder<LoginBlocs, LoginState>(
                      builder: (context, state) {
                        if (state is EmailErrorState) {
                          return ReusableText(
                            text: state.emailErrorMessage,
                            textstyle:
                                appstyle(12, AppConst.kred, FontWeight.normal),
                            height: 15,
                            width: 300,
                          );
                        }
                        return Container();
                      },
                    ),
                    HeightSpace(height: 10.h),
                    CustomeTextField(
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: AppConst.knavypurple4,
                      ),
                      obsecure: _isVisible,
                      hintText: "Enter Your Password",
                      controller: passwordController,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        child: _isVisible
                            ? const Icon(
                                Icons.visibility,
                                color: AppConst.knavypurple4,
                              )
                            : const Icon(
                                Icons.visibility_off,
                                color: AppConst.knavypurple4,
                              ),
                      ),
                    ),
                    HeightSpace(height: 20.h),
                    BlocConsumer<LoginBlocs, LoginState>(
                        listener: (context, state) {
                      if (state is LoginFailedState) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: AppConst.kred,
                            duration: const Duration(seconds: 3),
                            content: Text(state.loginfailmessage)));
                      }

                      if (state is LoggedInstate) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/landingPage', (Route<dynamic> route) => false);
                      }
                    }, builder: (context, state) {
                      if (state is LoginLoadingState) {
                        return SizedBox(
                            height: 50.h,
                            width: 150.h,
                            child: const CircularProgressIndicator());
                      }
                      return CustomOutlineButton(
                        ontap: () {
                          BlocProvider.of<LoginBlocs>(context).add(
                            LoginPressEvent(
                                email: emailController.text,
                                password: passwordController.text),
                          );
                        },
                        textheight: 40.h,
                        textwidth: AppConst.kWidth * 0.3,
                        width: AppConst.kWidth * 0.4,
                        height: 50.h,
                        borradius: 15,
                        borcolor: AppConst.knavypurple2,
                        text: "Login",
                        textstyle: appstyle(
                          15,
                          AppConst.knavypurple4,
                          FontWeight.w600,
                        ),
                      );
                    }),
                    HeightSpace(height: 10.h),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/forgotPassPage");
                      },
                      child: ReusableText(
                          height: 30,
                          width: 150,
                          text: "Forgot Password !!",
                          textstyle:
                              appstyle(14, AppConst.kred, FontWeight.w600)),
                    ),
                    HeightSpace(height: 5.h),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/registerPage");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ReusableText(
                              height: 30,
                              width: 40,
                              text: "Don't",
                              textstyle:
                                  appstyle(14, AppConst.kred, FontWeight.w600)),
                          const WidthSpace(width: 10),
                          ReusableText(
                            height: 30,
                            width: 150,
                            text: "Have an Account !!",
                            textstyle: appstyle(
                                14, AppConst.kGreyLight, FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
