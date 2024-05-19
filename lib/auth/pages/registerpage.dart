import 'package:engineering_mcq/auth/blocs/registerblocs/auth_events.dart';
import 'package:engineering_mcq/auth/blocs/registerblocs/authblocs.dart';
import 'package:engineering_mcq/auth/blocs/registerblocs/authstate.dart';
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

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool _isVisible = true;
  bool _isConfirmVisible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Column(
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
                CustomeTextField(
                  prefixIcon: const Icon(
                    Icons.person,
                    color: AppConst.knavypurple4,
                  ),
                  hintText: "Enter Your Name",
                  controller: nameController,
                ),
                HeightSpace(height: 10.h),
                CustomeTextField(
                  onChanged: (val) {
                    BlocProvider.of<RegisterBlocs>(context).add(
                      EmailChangeEvent(
                        emailController.text,
                      ),
                    );
                  },
                  prefixIcon: const Icon(
                    Icons.email,
                    color: AppConst.knavypurple4,
                  ),
                  hintText: "Enter your Email",
                  controller: emailController,
                  keyboardtype: TextInputType.emailAddress,
                ),
                BlocBuilder<RegisterBlocs, RegisterState>(
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
                  onChanged: (val) {
                    BlocProvider.of<RegisterBlocs>(context).add(
                      PhoneChangeEvent(phoneController.text),
                    );
                  },
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: AppConst.knavypurple4,
                  ),
                  hintText: "Enter your Phone.No",
                  controller: phoneController,
                  keyboardtype: TextInputType.phone,
                ),
                HeightSpace(height: 10.h),
                BlocBuilder<RegisterBlocs, RegisterState>(
                  builder: (context, state) {
                    if (state is PhonenumberErrorState) {
                      return ReusableText(
                        text: state.phoneNumberErrorMessage,
                        textstyle:
                            appstyle(12, AppConst.kred, FontWeight.normal),
                        height: 15,
                        width: 300,
                      );
                    }
                    return Container();
                  },
                ),
                CustomeTextField(
                  onChanged: (val) {
                    BlocProvider.of<RegisterBlocs>(context).add(
                      PassWordChangeEvent(passwordController.text),
                    );
                  },
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
                BlocBuilder<RegisterBlocs, RegisterState>(
                  builder: (context, state) {
                    if (state is PasswordErrorState) {
                      return ReusableText(
                        text: state.passwordErrorMessage,
                        textstyle:
                            appstyle(12, AppConst.kred, FontWeight.normal),
                        height: 100,
                        width: 300,
                      );
                    }
                    return Container();
                  },
                ),
                HeightSpace(height: 10.h),
                CustomeTextField(
                  onChanged: (val) {
                    BlocProvider.of<RegisterBlocs>(context).add(
                      ConfirmPasswordChange(passwordController.text,
                          confirmPasswordController.text),
                    );
                  },
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: AppConst.knavypurple4,
                  ),
                  obsecure: _isConfirmVisible,
                  hintText: "Confirm Your Password",
                  controller: confirmPasswordController,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isConfirmVisible = !_isConfirmVisible;
                      });
                    },
                    child: _isConfirmVisible
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
                BlocBuilder<RegisterBlocs, RegisterState>(
                  builder: (context, state) {
                    if (state is PasswordNotConfirmedState) {
                      return ReusableText(
                        text: state.passeordErrorMessage,
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
                BlocConsumer<RegisterBlocs, RegisterState>(
                    listener: (context, state) {
                  if (state is RegisteredState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.registerMessage)));
                    Navigator.pushNamed(context, "/loginPage");
                  }
                }, builder: (context, state) {
                  if (state is RegisterLoadingState) {
                    return SizedBox(
                      height: 50.h,
                      width: 100.w,
                      child: const CircularProgressIndicator(
                          color: AppConst.knavypurple4),
                    );
                  }
                  if (state is RegisterErrorState) {
                    return Column(
                      children: [
                        CustomOutlineButton(
                          textheight: 40.h,
                          textwidth: AppConst.kWidth * 0.3,
                          width: AppConst.kWidth * 0.4,
                          height: 50.h,
                          borradius: 15,
                          borcolor: AppConst.knavypurple2,
                          text: "Register",
                          textstyle: appstyle(
                            15,
                            AppConst.knavypurple4,
                            FontWeight.w600,
                          ),
                          ontap: () {
                            BlocProvider.of<RegisterBlocs>(context).add(
                              RegistereEvent(
                                password: passwordController.text,
                                confirmPassword: confirmPasswordController.text,
                                email: emailController.text,
                                phoneNumber: phoneController.text,
                                user: nameController.text,
                              ),
                            );
                          },
                        ),
                        ReusableText(
                          text: state.errorMessage,
                          textstyle:
                              appstyle(12, AppConst.kred, FontWeight.normal),
                          height: 15,
                          width: 300,
                        ),
                      ],
                    );
                  }
                  return CustomOutlineButton(
                    textheight: 40.h,
                    textwidth: AppConst.kWidth * 0.3,
                    width: AppConst.kWidth * 0.4,
                    height: 50.h,
                    borradius: 15,
                    borcolor: AppConst.knavypurple2,
                    text: "Register",
                    textstyle: appstyle(
                      15,
                      AppConst.knavypurple4,
                      FontWeight.w600,
                    ),
                    ontap: () {
                      BlocProvider.of<RegisterBlocs>(context).add(
                        RegistereEvent(
                          password: passwordController.text,
                          confirmPassword: confirmPasswordController.text,
                          email: emailController.text,
                          phoneNumber: phoneController.text,
                          user: nameController.text,
                        ),
                      );
                    },
                  );
                }),
                HeightSpace(height: 10.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReusableText(
                          height: 30,
                          width: 60,
                          text: "Already",
                          textstyle:
                              appstyle(14, AppConst.kGreen, FontWeight.w600)),
                      const WidthSpace(width: 10),
                      ReusableText(
                        height: 30,
                        width: 150,
                        text: "Have an Account !!",
                        textstyle:
                            appstyle(14, AppConst.kGreyLight, FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                HeightSpace(height: 20.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
