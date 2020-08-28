import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jumpets_app/data/repositories/user_repository.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  UserRepository repository;
  ProfileBloc({@required this.repository, @required User user})
      : super(ProfileState(user));

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
