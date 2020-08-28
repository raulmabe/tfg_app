part of 'edit_profile_bloc.dart';

@immutable
class EditProfileState {
  const EditProfileState({
    this.status = FormzStatus.pure,
    this.email = const Email.pure(''),
    this.password = const PasswordNullable.pure(),
    this.name = const Name.pure(''),
    this.address = const Address.pure(''),
    this.phone = const Phone.pure(0),
    this.web = const Web.pure(''),
  });

  final FormzStatus status;
  final Email email;
  final Name name;
  final Web web;
  final Address address;
  final Phone phone;
  final PasswordNullable password;

  EditProfileState copyWith({
    FormzStatus status,
    Email email,
    Name name,
    Web web,
    Address address,
    Phone phone,
    PasswordNullable password,
  }) {
    return EditProfileState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      name: name ?? this.name,
      web: web ?? this.web,
      phone: phone ?? this.phone,
    );
  }

  @override
  String toString() {
    return status.toString();
  }
}
