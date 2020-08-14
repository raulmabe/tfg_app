import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:jumpets_app/data/repositories/authentication_repository.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    @required AuthenticationRepository authenticationRepository,
  })  : assert(authenticationRepository != null),
        _authenticationRepository = authenticationRepository,
        super(LoginState());

  final AuthenticationRepository _authenticationRepository;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    switch (event.runtimeType) {
      case LoginEmailChanged:
        yield _mapLoginEmailChangedToState(event);
        break;
      case LoginPasswordChanged:
        yield _mapLoginPasswordChangedToState(event);
        break;
      case LoginLogInSubmitted:
        yield* _mapLoginSubmittedChangedToState(event);
        break;
      default:
    }
  }

  LoginState _mapLoginEmailChangedToState(
    LoginEmailChanged event,
  ) {
    final email = Email.dirty(event.email);
    FormzStatus status = Formz.validate([state.password, email]);
    print('${email.value}:${state.password.value} = $status');
    return state.copyWith(email: email, status: status);
  }

  LoginState _mapLoginPasswordChangedToState(
    LoginPasswordChanged event,
  ) {
    final password = Password.dirty(event.password);
    return state.copyWith(
        password: password, status: Formz.validate([state.email, password]));
  }

  Stream<LoginState> _mapLoginSubmittedChangedToState(
    LoginLogInSubmitted event,
  ) async* {
    if (state.status.isValidated) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      try {
        await _authenticationRepository.logIn(
          email: state.email.value,
          password: state.password.value,
        );

        print('Now should be authenticated');
        yield state.copyWith(status: FormzStatus.submissionSuccess);
      } catch (err, stack) {
        print('onCatch $err, $stack');
        yield state.copyWith(status: FormzStatus.submissionFailure);
      }
    }
  }
}
