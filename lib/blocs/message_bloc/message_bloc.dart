import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:jumpets_app/blocs/info_handler_bloc/info_handler_bloc.dart';
import 'package:jumpets_app/blocs/rooms_bloc/rooms_bloc.dart';
import 'package:jumpets_app/data/repositories/user_repository.dart';
import 'package:jumpets_app/data/repositories/websocket_repository.dart';
import 'package:jumpets_app/models/chats/message.dart';
import 'package:jumpets_app/models/chats/room.dart';
import 'package:meta/meta.dart';
import 'package:built_collection/built_collection.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final AuthBloc authBloc;
  final ErrorHandlerBloc errorBloc;
  final InfoHandlerBloc infoBloc;
  final RoomsBloc roomsBloc;
  final UserRepository repository;

  Map<String, StreamSubscription<QueryResult>> _roomsSubscriptions = Map();

  MessageBloc(
      {@required this.repository,
      @required this.authBloc,
      @required this.roomsBloc,
      @required this.infoBloc,
      @required this.errorBloc})
      : assert(repository != null),
        assert(authBloc != null),
        assert(roomsBloc != null),
        assert(infoBloc != null),
        assert(errorBloc != null),
        super(MessageInitial());

  @override
  Stream<MessageState> mapEventToState(
    MessageEvent event,
  ) async* {
    switch (event.runtimeType) {
      case MessageSent:
        yield MessageLoading();
        yield await _mapMessageSentToState(event);
        break;
      case MessageReceived:
        _mapMessageReceivedToUpdateRoom(event);
        break;
      case RoomsUpdated:
        _mapUserRoomsUpdated(event);
        break;
      default:
    }
  }

  Future<MessageState> _mapMessageSentToState(MessageSent event) async {
    try {
      Room room = await repository.sendMessage(
          text: event.text,
          userId: event.toUserId,
          adId: event.adId,
          token: authBloc.state.authStatus?.authData?.token);

      roomsBloc.add(RoomUpdated(room: room));

      return MessageSuccess(room: room);
    } catch (err, stack) {
      errorBloc.add(ErrorHandlerCatched(
        bloc: this,
        event: event,
        error: err,
      ));
      return MessageFailure();
    }
  }

  void _mapMessageReceivedToUpdateRoom(MessageReceived event) async {
    if (event.message.sender.id !=
        authBloc.state.authStatus?.authData?.user?.id) {
      Room room = roomsBloc.getRoomWithId(event.roomId);

      if (room != null) {
        if (!room.messages.any((msg) => msg.id == event.message.id)) {
          room = room.rebuild((r) => r
            ..messages = ListBuilder<Message>(
                List.from(r.messages.build().asList())..add(event.message)));
        }

        roomsBloc.add(RoomUpdated(room: room));
      }
    }
  }

  void _mapUserRoomsUpdated(RoomsUpdated event) {
    event.roomsIds.forEach((roomID) {
      // * Add subscriptions of unsubscribed rooms
      if (!_roomsSubscriptions.containsKey(roomID)) {
        _roomsSubscriptions.putIfAbsent(
            roomID,
            () => WebSocketRepository.client(
                        authBloc.state.authStatus?.authData?.token)
                    .subscribe(
                  SubscriptionOptions(
                    document: WebSocketRepository.messageSent(roomID),
                  ),
                )
                    .listen((result) async {
                  if (result.data != null && result.data.isNotEmpty) {
                    Message msg = Message.fromJson(result.data['messageSent']);

                    if (msg.sender.id !=
                        authBloc.state.authStatus?.authData?.user?.id) {
                      Room room = roomsBloc.getRoomWithId(roomID);

                      if (room != null &&
                          !room.messages
                              .any((message) => message.id == msg.id)) {
                        this.add(MessageReceived(message: msg, roomId: roomID));

                        infoBloc
                            .add(ChatMessageReceived(msg: msg, roomId: roomID));
                      }
                    }
                  }
                }));
      }
    });

    // * Remove subscriptions of unused rooms
    _roomsSubscriptions.keys.forEach((roomId) {
      if (!event.roomsIds.contains(roomId)) {
        _roomsSubscriptions[roomId]?.cancel();
        _roomsSubscriptions.remove(roomId);
      }
    });
  }

  @override
  Future<void> close() {
    _roomsSubscriptions.keys.forEach((roomId) {
      _roomsSubscriptions[roomId]?.cancel();
    });
    return super.close();
  }
}
