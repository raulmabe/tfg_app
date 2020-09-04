part of 'message_bloc.dart';

@immutable
abstract class MessageState {}

class MessageInitial extends MessageState {}

class MessageLoading extends MessageState {}

class MessageSuccess extends MessageState {
  final Room room;
  MessageSuccess({this.room});
}

class MessageFailure extends MessageState {}
