import 'dart:convert';
import 'package:engineering_mcq/auth/blocs/registerblocs/auth_events.dart';
import 'package:engineering_mcq/auth/blocs/registerblocs/authstate.dart';
import 'package:engineering_mcq/common/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'package:http/http.dart' as http;

class RegisterBlocs extends Bloc<RegisterEvents, RegisterState> {
  RegisterBlocs() : super(RegisterInitialState()) {
    on<EmailChangeEvent>((event, emit) {
      if (!validator.email(event.email)) {
        emit(EmailErrorState("Invalid Email"));
      } else {
        emit(RegisterInitialState());
      }
    });
    on<PhoneChangeEvent>((event, emit) {
      if (event.phoneNumber.length != 10) {
        emit(PhonenumberErrorState("Invalid PhoneNumber"));
      } else {
        emit(RegisterInitialState());
      }
    });
    on<PassWordChangeEvent>((event, emit) {
      if (!validator.mediumPassword(event.password)) {
        emit(PasswordErrorState(
            "Weak Password\nYour Password Must Contain\nUppercase alphabets\nSpecial Characters \nNumbers"));
      } else {
        emit(RegisterInitialState());
      }
    });
    on<ConfirmPasswordChange>((event, emit) {
      if (event.confirmPassword != event.password) {
        emit(PasswordNotConfirmedState("Password didn't Match"));
      } else {
        emit(RegisterInitialState());
      }
    });
    on<RegistereEvent>((event, emit) async {
      if (event.user.length < 3) {
        emit(RegisterErrorState("Invalid Username"));
      } else if ((!validator.email(event.email))) {
        emit(RegisterErrorState("Invalid Email"));
      } else if ((event.phoneNumber.length != 10)) {
        emit(RegisterErrorState("Invalid PhoneNumber"));
      } else if ((!validator.mediumPassword(event.password))) {
        emit(RegisterErrorState("Invalid Password"));
      } else if ((event.confirmPassword != event.password)) {
        emit(RegisterErrorState("Password didn't Match"));
      } else {
        try {
          emit(RegisterLoadingState());
          var response = await http
              .post(Uri.parse("${ApiProvider().baseUrl}register/"), body: {
            "username": event.user,
            "email": event.email,
            "password": event.password,
            "phone": event.phoneNumber,
          });
          if (response.statusCode == 201) {
            emit(RegisteredState(
                "Registered Succesfully You are Good to Login"));
          } else {
            emit(RegisterErrorState(jsonDecode(response.body)["message"]));
          }
        } catch (e) {
          emit(RegisterErrorState(e.toString()));
        }
      }
    });
  }
}
