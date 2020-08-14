import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:jumpets_app/data/repositories/authentication_repository.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/models/wrappers/auth_status.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    @required AuthenticationRepository authenticationRepository,
  })  : assert(authenticationRepository != null),
        _authenticationRepository = authenticationRepository,
        super(const AuthState()) {
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) => add(AuthStatusChanged(status)),
    );
  }

  StreamSubscription<AuthStatus> _authenticationStatusSubscription;

  final AuthenticationRepository _authenticationRepository;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    switch (event.runtimeType) {
      case AuthStatusChanged:
        yield AuthState(authStatus: (event as AuthStatusChanged).status);
        break;
      case AuthLogoutRequested:
        _authenticationRepository.logOut();
        break;
      default:
    }
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription?.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }
}
