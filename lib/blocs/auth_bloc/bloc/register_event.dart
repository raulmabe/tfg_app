part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterNameChanged extends RegisterEvent {
  RegisterNameChanged(this.name);

  final String name;
}

class RegisterEmailChanged extends RegisterEvent {
  RegisterEmailChanged(this.email);

  final String email;
}

class RegisterPasswordChanged extends RegisterEvent {
  RegisterPasswordChanged(this.password);

  final String password;
}

class RegisterSecondPasswordChanged extends RegisterEvent {
  RegisterSecondPasswordChanged(this.password);

  final String password;
}

class RegisterSubmitted extends RegisterEvent {
  RegisterSubmitted(this.type);
  final UserType type;
}
