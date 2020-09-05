import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:jumpets_app/blocs/rooms_bloc/rooms_bloc.dart';
import 'package:jumpets_app/data/repositories/user_repository.dart';
import 'package:jumpets_app/models/chats/message.dart';
import 'package:jumpets_app/models/chats/room.dart';
import 'package:meta/meta.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final AuthBloc authBloc;
  final ErrorHandlerBloc errorBloc;
  final RoomsBloc roomsBloc;
  final UserRepository repository;

  MessageBloc(
      {@required this.repository,
      @required this.authBloc,
      @required this.roomsBloc,
      @required this.errorBloc})
      : assert(repository != null),
        assert(authBloc != null),
        assert(roomsBloc != null),
        assert(errorBloc != null),
        super(MessageInitial());

  @override
  Stream<MessageState> mapEventToState(
    MessageEvent event,
  ) async* {
    if (event is MessageSent) {
      yield MessageLoading();

      try {
        Room room = await repository.sendMessage(
            text: event.text,
            userId: event.toUserId,
            adId: event.adId,
            token: authBloc.state.authStatus?.authData?.token);

        roomsBloc.add(RoomUpdated(room: room));

        yield MessageSuccess(room: room);
      } catch (err, stack) {
        errorBloc.add(ErrorHandlerCatched(
          bloc: this,
          event: event,
          error: err,
        ));
        yield MessageFailure();
      }
    }
  }
}
