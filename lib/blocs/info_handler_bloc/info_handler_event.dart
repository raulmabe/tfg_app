part of 'info_handler_bloc.dart';

@immutable
abstract class InfoHandlerEvent {}

class MessageAdded extends InfoHandlerEvent {
  final String msg;
  final bool notification;
  MessageAdded({this.msg, this.notification = false});
}
