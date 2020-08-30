part of 'edit_profile_bloc.dart';

@immutable
abstract class EditProfileEvent {}

class ProfileNameChanged extends EditProfileEvent {
  final String name;
  ProfileNameChanged(this.name);
}

class ProfileEmailChanged extends EditProfileEvent {
  final String email;
  ProfileEmailChanged(this.email);
}

class ProfileAddressChanged extends EditProfileEvent {
  final String address;
  ProfileAddressChanged(this.address);
}

class ProfileWebChanged extends EditProfileEvent {
  final String web;
  ProfileWebChanged(this.web);
}

class ProfilePasswordChanged extends EditProfileEvent {
  final String password;
  ProfilePasswordChanged(this.password);
}

class ProfilePhoneChanged extends EditProfileEvent {
  final int phone;
  ProfilePhoneChanged(this.phone);
}

class ProfileImgChanged extends EditProfileEvent {
  final file;
  ProfileImgChanged(this.file);
}

class ProfileEditSubmitted extends EditProfileEvent {}
