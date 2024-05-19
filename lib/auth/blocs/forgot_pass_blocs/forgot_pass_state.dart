part of 'forgot_pass_bloc.dart';

abstract class ForgotPassState {}

final class ForgotPassInitial extends ForgotPassState {}

final class LogingcodeLoadingState extends ForgotPassState {}

final class LoginCodeSentState extends ForgotPassState {}

final class LoginCodeSentErrorState extends ForgotPassState {
  final String error;
  LoginCodeSentErrorState(this.error);
}

final class PinEnterState extends ForgotPassState {}

final class PinMatchState extends ForgotPassState {}

final class PinMissMatchState extends ForgotPassState {
  final String error;
  PinMissMatchState(this.error);
}

final class PaswordValidState extends ForgotPassState {}

final class PaswordInvalidState extends ForgotPassState {
  final String error;
  PaswordInvalidState(this.error);
}

final class PasswordChangeLoadingState extends ForgotPassState {}

final class PasswordChangeErrorState extends ForgotPassState {
  final String error;
  PasswordChangeErrorState(this.error);
}

final class PasswordChangedState extends ForgotPassState {
  final String message;
  PasswordChangedState(this.message);
}
