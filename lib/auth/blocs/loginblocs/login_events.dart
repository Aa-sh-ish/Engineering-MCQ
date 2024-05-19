abstract class LoginEvents {}

class EmailChangeEvent extends LoginEvents {
  final String email;
  EmailChangeEvent(this.email);
}

class LoginPressEvent extends LoginEvents {
  final String email;
  final String password;

  LoginPressEvent({
    required this.email,
    required this.password,
  });
}

class LogoutPressEvent extends LoginEvents {}
