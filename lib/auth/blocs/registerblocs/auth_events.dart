abstract class RegisterEvents {}

class EmailChangeEvent extends RegisterEvents {
  final String email;
  EmailChangeEvent(this.email);
}

class PhoneChangeEvent extends RegisterEvents {
  final String phoneNumber;
  PhoneChangeEvent(this.phoneNumber);
}

class PassWordChangeEvent extends RegisterEvents {
  final String password;
  PassWordChangeEvent(this.password);
}

class ConfirmPasswordChange extends RegisterEvents {
  final String confirmPassword;
  final String password;
  ConfirmPasswordChange(this.confirmPassword, this.password);
}

class RegistereEvent extends RegisterEvents {
  final String user;
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;

  RegistereEvent({
    required this.user,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
  });
}
