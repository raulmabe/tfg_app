part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginEmailChanged extends LoginEvent {
  LoginEmailChanged(this.email);

  final String email;
}

class LoginPasswordChanged extends LoginEvent {
  LoginPasswordChanged(this.password);

  final String password;
}

class LoginLogInSubmitted extends LoginEvent {
  LoginLogInSubmitted();
}
