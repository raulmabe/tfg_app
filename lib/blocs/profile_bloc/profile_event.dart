part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class UserUpdated extends ProfileEvent {
  final User user;
  UserUpdated({this.user});
}

class UserFetched extends ProfileEvent {}
