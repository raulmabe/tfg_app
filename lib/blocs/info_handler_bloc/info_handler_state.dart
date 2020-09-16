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

class InfoDialogAction extends InfoHandlerState {
  final String msg;
  final String onMainText;
  final String onSecondaryText;
  final Function onMainCallback;
  final Function onSecondaryCallback;
  InfoDialogAction(this.msg, this.onMainCallback, this.onMainText,
      this.onSecondaryCallback, this.onSecondaryText);
}

class ChatMessage extends InfoHandlerState {
  final Message msg;
  final String roomId;

  ChatMessage(this.msg, this.roomId);
}
