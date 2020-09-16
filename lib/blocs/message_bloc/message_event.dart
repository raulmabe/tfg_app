part of 'message_bloc.dart';

@immutable
abstract class MessageEvent {}

class MessageSent extends MessageEvent {
  final String toUserId;
  final String adId;
  final String text;
  MessageSent({this.adId, @required this.text, @required this.toUserId});
}

class MessageReceived extends MessageEvent {
  final Message message;
  final String roomId;
  MessageReceived({this.message, this.roomId});
}

class RoomsUpdated extends MessageEvent {
  final List<String> roomsIds;
  RoomsUpdated({this.roomsIds});
}
