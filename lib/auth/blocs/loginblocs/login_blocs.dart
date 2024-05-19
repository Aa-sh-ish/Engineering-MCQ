// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'dart:convert';
import 'package:engineering_mcq/auth/blocs/loginblocs/login_events.dart';
import 'package:engineering_mcq/auth/blocs/loginblocs/login_state.dart';
import 'package:engineering_mcq/auth/model/usermodel.dart';
import 'package:engineering_mcq/common/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginBlocs extends Bloc<LoginEvents, LoginState> {
  LoginBlocs() : super(LoginInitialState()) {
    Future<String?> gettoken() async {
      String? token = await getUserToken();
      String? id = await getUserId();
      if (token != null) {
        emit(ReLoggingLoadingState());
        try {
          var response = await http.get(
            Uri.parse("${ApiProvider().baseUrl}api/users/$id"),
            headers: {
              'Authorization': 'Bearer $token',
            },
          );
          if (response.statusCode == 200) {
            Users user = Users.fromJson(jsonDecode(response.body));
            emit(LoggedInstate(user));
          } else {
            emit(LoginErrorState("NetWork Not Available"));
          }
        } on Exception {
          emit(LoginInitialState());
        }
      } else {
        emit(LoginInitialState());
      }
      return null;
    }

    gettoken();

    on<EmailChangeEvent>((event, emit) {
      if (!validator.email(event.email)) {
        emit(EmailErrorState("Invalid Email"));
      } else {
        emit(LoginInitialState());
      }
    });
    on<LoginPressEvent>((event, emit) async {
      if (!validator.email(event.email)) {
        emit(LoginErrorState("Invalid Email"));
      } else if (event.password.isEmpty) {
        emit(LoginErrorState("Password Cannot Be Null"));
      } else {
        try {
          emit(LoginLoadingState());
          var response = await http.post(
              Uri.parse("${ApiProvider().baseUrl}login/"),
              body: {"email": event.email, "password": event.password});

          if (response.statusCode == 200) {
            String responseMaps = response.body;
            Users user = Users.fromJson(jsonDecode(response.body));

            try {
              var rankResponse = await http.post(
                Uri.parse("${ApiProvider().baseUrl}aip/ranks"),
                body: {"userId": jsonDecode(responseMaps)["_id"]},
                headers: {
                  'Authorization':
                      'Bearer ${jsonDecode(responseMaps)["userToken"]}',
                },
              );
              if (rankResponse.statusCode == 400 ||
                  rankResponse.statusCode == 200) {
                saveUserId(jsonDecode(responseMaps)["_id"]);
                saveUserToken(jsonDecode(responseMaps)["userToken"]);
                emit(LoggedInstate(user));
              }
            } catch (e) {
              emit(LoginFailedState(e.toString()));
            }
          } else {
            emit(LoginFailedState(jsonDecode(response.body)['message']));
          }
        } catch (e) {
          emit(LoginFailedState(e.toString()));
        }
      }
    });
    on<LogoutPressEvent>((event, emit) {
      try {
        emit(LoggingOutLoadingState());
        deleteUserToken();
        emit(LoggedOutState(loggedOutMessage: "Logged Out Succesfully"));
      } catch (e) {
        emit(LoginErrorState(e.toString()));
      }
    });
  }

  void saveUserToken(userToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'userToken',
      userToken,
    );
  }

  void deleteUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userToken');
  }

  Future<String?> getUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('userToken');
    if (token == null) {
      return null;
    } else {
      return token;
    }
  }

  void saveUserId(userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'userId',
      userId,
    );
  }

  Future<String?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString('userId');
    if (userId == null) {
      return null;
    } else {
      return userId;
    }
  }
}
