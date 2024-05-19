import 'package:engineering_mcq/auth/blocs/loginblocs/login_blocs.dart';
import 'package:engineering_mcq/auth/blocs/loginblocs/login_events.dart';
import 'package:engineering_mcq/auth/blocs/loginblocs/login_state.dart';
import 'package:engineering_mcq/common/utils/constants.dart';
import 'package:engineering_mcq/common/widgets/appstyle.dart';
import 'package:engineering_mcq/common/widgets/outlinebutton.dart';
import 'package:engineering_mcq/core/pages/profile_page/widgets/logout_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBlocs, LoginState>(listener: (context, state) {
      if (state is LogginOutErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.loggingOutErrorMessage)));
      }
      if (state is LoggedOutState) {
        Navigator.pushNamedAndRemoveUntil(
            context, "/splashScreen", (Route<dynamic> route) => false);
      }
    }, builder: (context, state) {
      if (state is LoggingOutLoadingState) {
        return Container(
          decoration:
              BoxDecoration(border: Border.all(color: AppConst.kred, width: 3)),
          height: 50.h,
          width: 100.w,
          child: const CircularProgressIndicator(color: AppConst.knavypurple4),
        );
      }
      return CustomOutlineButton(
          ontap: () {
            logOutAlertDialogue(context,
                BlocProvider.of<LoginBlocs>(context).add(LogoutPressEvent()));
          },
          width: 100,
          height: 50,
          borradius: 25,
          borcolor: AppConst.kred,
          text: "Log Out",
          textstyle: appstyle(23, AppConst.kred, FontWeight.bold),
          textheight: 40,
          textwidth: 60);
    });
  }
}
