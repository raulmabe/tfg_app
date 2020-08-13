part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthEmailChanged extends AuthEvent {
  AuthEmailChanged(this.email);

  final String email;
}

class AuthPasswordChanged extends AuthEvent {
  AuthPasswordChanged(this.password);

  final String password;
}

class AuthFieldsCleared extends AuthEvent {}

class AuthLogInSubmitted extends AuthEvent {
  AuthLogInSubmitted();
}

class AuthLogoutRequested extends AuthEvent {}
