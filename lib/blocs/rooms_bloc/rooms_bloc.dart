import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:jumpets_app/data/repositories/user_repository.dart';
import 'package:jumpets_app/models/chats/room.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:meta/meta.dart';

part 'rooms_event.dart';
part 'rooms_state.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  final AuthBloc authBloc;
  final ErrorHandlerBloc errorBloc;
  final UserRepository repository;

  RoomsBloc(
      {@required this.repository,
      @required this.authBloc,
      @required this.errorBloc})
      : assert(repository != null),
        assert(authBloc != null),
        assert(errorBloc != null),
        super(RoomsInitial());

  @override
  Stream<RoomsState> mapEventToState(
    RoomsEvent event,
  ) async* {
    switch (event.runtimeType) {
      case RoomsFetched:
        yield RoomsLoading();
        yield await _mapRoomsFetchedToState(event);
        break;
      case RoomUpdated:
        if (state is RoomsSuccess) {
          List<Room> rooms;
          bool any = (state as RoomsSuccess)
              .rooms
              .any((room) => room.id == (event as RoomUpdated).room.id);

          if (any) {
            rooms = (state as RoomsSuccess)
                .rooms
                .map((room) => room.id == (event as RoomUpdated).room.id
                    ? (event as RoomUpdated).room
                    : room)
                .toList();
          } else {
            rooms = (state as RoomsSuccess).rooms
              ..add((event as RoomUpdated).room);
          }

          yield RoomsSuccess(rooms: rooms);
        }
        break;
      case RoomsInitialized:
        yield RoomsInitial();
        break;
      default:
    }
  }

  Future<RoomsState> _mapRoomsFetchedToState(RoomsFetched event) async {
    try {
      List<Room> rooms = await repository.getRooms(
          token: authBloc.state.authStatus?.authData?.token);

      return RoomsSuccess(rooms: rooms);
    } catch (err, stack) {
      return RoomsFailure(retry: () => this.add(event), msg: err.toString());
    }
  }

  Future<Room> gotAlreadyRoomWithUser(User user) async {
    if (state is RoomsSuccess) {
      return (state as RoomsSuccess).rooms.firstWhere(
          (room) => room.user1.id == user.id || room.user2.id == user.id, orElse: () => null);
    }
    return null;
  }

  Room getRoomWithId(String id) {
    if (state is RoomsSuccess) {
      return (state as RoomsSuccess)
          .rooms
          .firstWhere((room) => room.id == id, orElse: () => null);
    }
    return null;
  }
}
