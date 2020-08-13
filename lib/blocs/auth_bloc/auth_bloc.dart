import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:jumpets_app/data/repositories/authentication_repository.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    @required AuthenticationRepository authenticationRepository,
  })  : assert(authenticationRepository != null),
        _authenticationRepository = authenticationRepository,
        super(const AuthState());

  final AuthenticationRepository _authenticationRepository;
  AuthData authData;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    switch (event.runtimeType) {
      case AuthEmailChanged:
        yield _mapAuthEmailChangedToState(event);
        break;
      case AuthPasswordChanged:
        yield _mapAuthPasswordChangedToState(event);
        break;
      case AuthLogInSubmitted:
        yield* _mapAuthLogInSubmittedChangedToState(event);
        break;
      case AuthLogoutRequested:
        yield state.copyWith(authStatus: AuthenticationStatus.unauthenticated);
        break;
      default:
    }
  }

  AuthState _mapAuthEmailChangedToState(
    AuthEmailChanged event,
  ) {
    final email = Email.dirty(event.email);
    FormzStatus status = Formz.validate([state.password, email]);
    print('${email.value}:${state.password.value} = $status');
    return state.copyWith(email: email, formStatus: status);
  }

  AuthState _mapAuthPasswordChangedToState(
    AuthPasswordChanged event,
  ) {
    final password = Password.dirty(event.password);
    return state.copyWith(
        password: password,
        formStatus: Formz.validate([state.email, password]));
  }

  Stream<AuthState> _mapAuthLogInSubmittedChangedToState(
    AuthLogInSubmitted event,
  ) async* {
    if (state.formStatus.isValidated) {
      yield state.copyWith(formStatus: FormzStatus.submissionInProgress);
      try {
        authData = await _authenticationRepository.logIn(
          email: state.email.value,
          password: state.password.value,
        );

        print('${authData?.user}');
        print('Now should be authenticated');
        yield state.copyWith(
            authStatus: AuthenticationStatus.authenticated,
            authData: authData,
            formStatus: FormzStatus.submissionSuccess);
      } catch (err, stack) {
        print('onCatch $err, $stack');
        yield state.copyWith(formStatus: FormzStatus.submissionFailure);
      }
    }
  }
}

enum AuthenticationStatus { unknown, authenticated, unauthenticated }
