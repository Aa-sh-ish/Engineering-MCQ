import 'package:engineering_mcq/auth/model/usermodel.dart';

abstract class LoginState {}

class EmailErrorState extends LoginState {
  final String emailErrorMessage;
  EmailErrorState(this.emailErrorMessage);
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  final String errorMessage;
  LoginErrorState(this.errorMessage);
}

class LoginFailedState extends LoginState {
  final String loginfailmessage;
  LoginFailedState(this.loginfailmessage);
}

class LoggedInstate extends LoginState {
  final Users users;
  LoggedInstate(this.users);
}

class LoggingOutLoadingState extends LoginState {}

class LogginOutErrorState extends LoginState {
  final String loggingOutErrorMessage;
  LogginOutErrorState({required this.loggingOutErrorMessage});
}

class LoggedOutState extends LoginState {
  final String loggedOutMessage;
  LoggedOutState({required this.loggedOutMessage});
}

class RankupdatedState extends LoginState {
  final String message;
  RankupdatedState({required this.message});
}

class ReLoggingLoadingState extends LoginState {}
