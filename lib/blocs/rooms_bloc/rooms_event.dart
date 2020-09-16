part of 'rooms_bloc.dart';

@immutable
abstract class RoomsEvent {}

class RoomsInitialized extends RoomsEvent {}

class RoomsFetched extends RoomsEvent {}

class RoomUpdated extends RoomsEvent {
  final Room room;
  RoomUpdated({this.room});
}
