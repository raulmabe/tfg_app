part of 'info_handler_bloc.dart';

@immutable
abstract class InfoHandlerState {}

class InfoHandlerEmpty extends InfoHandlerState {}

class InfoNotification extends InfoHandlerState {
  final String msg;
  InfoNotification(this.msg);
}

class InfoDialog extends InfoHandlerState {
  final String msg;
  InfoDialog(
    this.msg,
  );
}
