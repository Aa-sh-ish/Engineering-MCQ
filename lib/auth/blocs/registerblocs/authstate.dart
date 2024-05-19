abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class EmailErrorState extends RegisterState {
  final String emailErrorMessage;
  EmailErrorState(this.emailErrorMessage);
}

class PasswordErrorState extends RegisterState {
  final String passwordErrorMessage;
  PasswordErrorState(this.passwordErrorMessage);
}

class PasswordNotConfirmedState extends RegisterState {
  final String passeordErrorMessage;
  PasswordNotConfirmedState(this.passeordErrorMessage);
}

class PhonenumberErrorState extends RegisterState {
  final String phoneNumberErrorMessage;
  PhonenumberErrorState(this.phoneNumberErrorMessage);
}

class RegisterErrorState extends RegisterState {
  final String errorMessage;
  RegisterErrorState(this.errorMessage);
}

class RegisteredState extends RegisterState {
  final String registerMessage;
  RegisteredState(this.registerMessage);
}

class RegisterLoadingState extends RegisterState {}
