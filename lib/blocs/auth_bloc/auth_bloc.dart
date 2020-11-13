import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:jumpets_app/blocs/info_handler_bloc/info_handler_bloc.dart';
import 'package:jumpets_app/data/repositories/authentication_repository.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/models/wrappers/auth_status.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
      {@required AuthenticationRepository authenticationRepository,
      @required this.errorBloc,
      @required this.infoBloc})
      : assert(authenticationRepository != null),
        assert(errorBloc != null),
        assert(infoBloc != null),
        _authenticationRepository = authenticationRepository,
        super(const AuthState()) {
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) => add(AuthStatusChanged(status)),
    );
  }

  final ErrorHandlerBloc errorBloc;
  final InfoHandlerBloc infoBloc;
  StreamSubscription<AuthStatus> _authenticationStatusSubscription;

  final AuthenticationRepository _authenticationRepository;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    switch (event.runtimeType) {
      case AuthStatusChanged:
        yield AuthState(authStatus: (event as AuthStatusChanged).status);
        _addTimer();
        break;
      case AuthLogoutRequested:
        _authenticationRepository.logOut();
        break;
      case AuthUserUpdated:
        AuthStatus authStatus = state.authStatus.copyWith(
            authData: state.authStatus.authData
                .rebuild((a) => a..user = (event as AuthUserUpdated).user));

        yield AuthState(authStatus: authStatus);
        break;
      default:
    }
  }

  void _addTimer() {
    if (state.authStatus.status == AuthenticationStatus.authenticated) {
      new Timer(Duration(hours: state.authStatus.authData.tokenExpiration), () {
        this.add(AuthLogoutRequested());
        infoBloc.add(MessageAdded(
          msg: 'token_expiration_timeout',
        ));
      });
    }
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription?.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }
}
