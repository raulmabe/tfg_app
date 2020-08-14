part of 'register_bloc.dart';

class RegisterState {
  const RegisterState({
    this.status = FormzStatus.pure,
    this.email = const Email.pure(),
    this.name = const Name.pure(),
    this.password = const Password.pure(),
    this.confirmedPassword = const Password.pure(),
  });

  final FormzStatus status;
  final Email email;
  final Name name;
  final Password password;
  final Password confirmedPassword;

  RegisterState copyWith({
    FormzStatus status,
    Email email,
    Name name,
    Password password,
    Password confirmedPassword,
  }) {
    return RegisterState(
        status: status ?? this.status,
        email: email ?? this.email,
        name: name ?? this.name,
        password: password ?? this.password,
        confirmedPassword: confirmedPassword ?? this.confirmedPassword);
  }
}
