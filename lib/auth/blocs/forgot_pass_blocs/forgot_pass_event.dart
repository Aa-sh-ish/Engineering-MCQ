part of 'forgot_pass_bloc.dart';

abstract class ForgotPassEvent {}

class CodeRequestEvent extends ForgotPassEvent {
  final String email;
  CodeRequestEvent({required this.email});
}

class PinSendEnterEvent extends ForgotPassEvent {
  final String pin;
  PinSendEnterEvent({required this.pin});
}

class PasswordChangeRequestEvent extends ForgotPassEvent {
  final String newPassword, email;
  PasswordChangeRequestEvent({
    required this.newPassword,
    required this.email,
  });
}
