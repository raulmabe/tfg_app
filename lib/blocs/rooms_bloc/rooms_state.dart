part of 'rooms_bloc.dart';

@immutable
abstract class RoomsState {}

class RoomsInitial extends RoomsState {}

class RoomsLoading extends RoomsState {}

class RoomsSuccess extends RoomsState {
  final List<Room> rooms;
  RoomsSuccess({this.rooms});
}

class RoomsFailure extends RoomsState {}
