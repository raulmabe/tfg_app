part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable{
  const LoginState({
    this.status = FormzStatus.pure,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
  });

  final FormzStatus status;
  final Email email;
  final Password password;

  LoginState copyWith({
    FormzStatus status,
    Email email,
    Password password,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
  @override
  bool get stringify => true;
  @override
  List<Object> get props => [status, email.value, password.value ];
}
