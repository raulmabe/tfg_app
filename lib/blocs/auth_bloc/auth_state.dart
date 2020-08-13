part of 'auth_bloc.dart';

@immutable
class AuthState {
  const AuthState({
    this.authStatus = AuthenticationStatus.unknown,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.formStatus = FormzStatus.pure,
    this.authData,
  });

  AuthState copyWith(
      {FormzStatus formStatus,
      Email email,
      Password password,
      AuthenticationStatus authStatus,
      AuthData authData}) {
    return AuthState(
        formStatus: formStatus ?? this.formStatus,
        email: email ?? this.email,
        password: password ?? this.password,
        authStatus: authStatus ?? this.authStatus,
        authData: authData ?? this.authData);
  }

  final FormzStatus formStatus;
  final Email email;
  final Password password;

  final AuthenticationStatus authStatus;
  final AuthData authData;

  @override
  String toString() {
    return '$formStatus';
  }
}
