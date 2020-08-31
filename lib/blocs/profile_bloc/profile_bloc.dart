import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:jumpets_app/data/repositories/user_repository.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository repository;
  final ErrorHandlerBloc errorBloc;
  ProfileBloc(
      {@required this.repository,
      @required this.errorBloc,
      @required User user})
      : assert(repository != null),
        assert(errorBloc != null),
        super(ProfileState(user));

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    switch (event.runtimeType) {
      case UserUpdated:
        if ((event as UserUpdated).user != null &&
            (event as UserUpdated).user.id == state.user.id) {
          yield ProfileState((event as UserUpdated).user);
        }
        break;
      case UserFetched:
        yield await _mapUserFetchedToState(event);
        break;
      default:
    }
  }

  Future<ProfileState> _mapUserFetchedToState(UserFetched event) async {
    try {
      User user = await repository.getUser(id: state.user.id);
      return ProfileState(user);
    } catch (err, stack) {
      print('OnCatch $err $stack');
      return state;
    }
  }
}
