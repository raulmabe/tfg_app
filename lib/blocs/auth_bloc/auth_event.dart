part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

/* class AuthEmailChanged extends AuthEvent {
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

class AuthLogoutRequested extends AuthEvent {} */

class AuthStatusChanged extends AuthEvent {
  AuthStatusChanged(this.status);

  final AuthStatus status;
}

class AuthUserUpdated extends AuthEvent {
  final User user;
  AuthUserUpdated(this.user);
}

class AuthLogoutRequested extends AuthEvent {}
