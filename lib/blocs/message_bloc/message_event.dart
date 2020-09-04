part of 'message_bloc.dart';

@immutable
abstract class MessageEvent {}

class MessageSent extends MessageEvent {
  final String toUserId;
  final String adId;
  final String text;
  MessageSent({this.adId, @required this.text, @required this.toUserId});
}
