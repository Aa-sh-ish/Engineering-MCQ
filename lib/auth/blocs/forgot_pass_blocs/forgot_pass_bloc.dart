import 'dart:convert';
// import 'dart:developer';
import 'package:email_otp/email_otp.dart';
import 'package:engineering_mcq/auth/provider/auth.config.dart';
import 'package:engineering_mcq/common/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:regexed_validator/regexed_validator.dart';
part 'forgot_pass_event.dart';
part 'forgot_pass_state.dart';

class ForgotPassBloc extends Bloc<ForgotPassEvent, ForgotPassState> {
  ForgotPassBloc() : super(ForgotPassInitial()) {
    on<CodeRequestEvent>((event, emit) async {
      try {
        emit(LogingcodeLoadingState());
        myAuth.setConfig(
          appEmail: "aashish33lamsal@gmail.com",
          appName: "Easy_Er_Engineering",
          otpLength: 5,
          otpType: OTPType.digitsOnly,
          userEmail: event.email,
        );
        if (await myAuth.sendOTP() == true) {
          emit(LoginCodeSentState());
        } else {
          emit(LoginCodeSentErrorState("Error Sending Login Code"));
        }
      } catch (error) {
        emit(LoginCodeSentErrorState(error.toString()));
      }
    });

    on<PinSendEnterEvent>((event, emit) async {
      emit(PinEnterState());
      try {
        if (await myAuth.verifyOTP(otp: event.pin) == true) {
          emit(PinMatchState());
        } else {
          emit(PinMissMatchState("Invalid Pin"));
        }
      } on Exception catch (e) {
        emit(PinMissMatchState(e.toString()));
      }
    });

    on<PasswordChangeRequestEvent>((event, emit) async {
      if (validator.mediumPassword(event.newPassword)) {
        try {
          emit(PasswordChangeLoadingState());
          var response = await http
              .patch(Uri.parse("${ApiProvider().baseUrl}api/users/"), body: {
            "email": event.email,
            "newPassword": event.newPassword,
          });
          if (response.statusCode == 200) {
            emit(PasswordChangedState((jsonDecode(response.body)["message"])));
          }
          if (response.statusCode == 404) {
            emit(PasswordChangeErrorState(
                (jsonDecode(response.body)["message"])));
          }
          if (response.statusCode == 500) {
            emit(PasswordChangeErrorState(
                "Failed To Change Password Try Again Later"));
          }
        } catch (e) {
          emit(PasswordChangeErrorState(e.toString()));
        }
      } else {
        emit(PasswordChangeErrorState("Password did not meet Requirements"));
      }
    });
  }
}
