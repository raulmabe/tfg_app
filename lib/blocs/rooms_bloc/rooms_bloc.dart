import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:jumpets_app/data/repositories/user_repository.dart';
import 'package:jumpets_app/models/chats/room.dart';
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
    if (event is RoomsFetched) {
      yield RoomsLoading();

      try {
        List<Room> rooms = await repository.getRooms(
            token: authBloc.state.authStatus?.authData?.token);

        yield RoomsSuccess(rooms: rooms);
      } catch (err, stack) {
        errorBloc.add(ErrorHandlerCatched(
          bloc: this,
          event: event,
          error: err,
        ));
        yield RoomsFailure();
      }
    }
  }
}
