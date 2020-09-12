part of 'info_handler_bloc.dart';

@immutable
abstract class InfoHandlerEvent {}

class MessageAdded extends InfoHandlerEvent {
  final String msg;
  final bool notification;
  MessageAdded({this.msg, this.notification = false});
}

class MessageActionAdded extends InfoHandlerEvent {
  final String msg;

  final String onMainText;
  final String onSecondaryText;
  final Function onMainCallback;
  final Function onSecondaryCallback;

  MessageActionAdded(
      {this.msg,
      this.onMainText = 'yes',
      this.onSecondaryText = 'no',
      this.onMainCallback,
      this.onSecondaryCallback});
}
