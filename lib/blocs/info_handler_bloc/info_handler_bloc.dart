import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jumpets_app/models/chats/message.dart';
import 'package:meta/meta.dart';

part 'info_handler_event.dart';
part 'info_handler_state.dart';

class InfoHandlerBloc extends Bloc<InfoHandlerEvent, InfoHandlerState> {
  InfoHandlerBloc() : super(InfoHandlerEmpty()) {
    _addFirstMsg();
  }

  @override
  Stream<InfoHandlerState> mapEventToState(
    InfoHandlerEvent event,
  ) async* {
    if (event is MessageAdded) {
      if (event.notification) {
        yield InfoNotification(event.msg);
      } else {
        yield InfoDialog(event.msg);
      }
      yield InfoHandlerEmpty();
    } else if (event is MessageActionAdded) {
      yield InfoDialogAction(event.msg, event.onMainCallback, event.onMainText,
          event.onSecondaryCallback, event.onSecondaryText);
    } else if (event is ChatMessageReceived) {
      yield ChatMessage(event.msg, event.roomId);
    }
  }

  void _addFirstMsg() async {
    await Future.delayed(
        Duration(seconds: 1),
        () => this.add(MessageAdded(
              msg: 'not_a_real_app_msg',
            )));
  }
}
