import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:jumpets_app/data/repositories/authentication_repository.dart';
import 'package:jumpets_app/models/enums/user_types.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(
      {@required AuthenticationRepository authenticationRepository,
      @required this.errorBloc})
      : assert(authenticationRepository != null),
        assert(errorBloc != null),
        _authenticationRepository = authenticationRepository,
        super(RegisterState());

  final ErrorHandlerBloc errorBloc;
  final AuthenticationRepository _authenticationRepository;
  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    switch (event.runtimeType) {
      case RegisterNameChanged:
        yield _mapRegisterNameChangedToState(event);
        break;
      case RegisterEmailChanged:
        yield _mapRegisterEmailChangedToState(event);
        break;
      case RegisterPasswordChanged:
        yield _mapRegisterPasswordChangedToState(event);
        break;
      case RegisterSecondPasswordChanged:
        yield _mapRegisterSecondPasswordChangedToState(event);
        break;
      case RegisterSubmitted:
        yield* _mapRegisterSubmittedChangedToState(event);
        break;
      default:
    }
  }

  RegisterState _mapRegisterNameChangedToState(
    RegisterNameChanged event,
  ) {
    final name = Name.dirty(event.name);
    return state.copyWith(
        name: name,
        status: state.password.value != state.confirmedPassword.value
            ? FormzStatus.invalid
            : Formz.validate(
                [state.password, state.confirmedPassword, name, state.email]));
  }

  RegisterState _mapRegisterEmailChangedToState(
    RegisterEmailChanged event,
  ) {
    final email = Email.dirty(event.email);
    return state.copyWith(
        email: email,
        status: state.password.value != state.confirmedPassword.value
            ? FormzStatus.invalid
            : Formz.validate(
                [state.password, state.confirmedPassword, email, state.name]));
  }

  RegisterState _mapRegisterPasswordChangedToState(
    RegisterPasswordChanged event,
  ) {
    final password = Password.dirty(event.password);
    return state.copyWith(
        password: password,
        status: password.value != state.confirmedPassword.value
            ? FormzStatus.invalid
            : Formz.validate(
                [state.email, state.confirmedPassword, password, state.name]));
  }

  RegisterState _mapRegisterSecondPasswordChangedToState(
    RegisterSecondPasswordChanged event,
  ) {
    final password = Password.dirty(event.password);

    print(
        '${password.value}:${state.password.value}=${password.value != state.password.value}');
    return state.copyWith(
        confirmedPassword: password,
        status: password.value != state.password.value
            ? FormzStatus.invalid
            : Formz.validate(
                [state.email, state.password, password, state.name]));
  }

  Stream<RegisterState> _mapRegisterSubmittedChangedToState(
    RegisterSubmitted event,
  ) async* {
    if (state.status.isValidated) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      try {
        await _authenticationRepository.register(
          type: event.type,
          name: state.name.value,
          email: state.email.value,
          password: state.password.value,
        );

        print('Now should be authenticated');
        yield state.copyWith(status: FormzStatus.submissionSuccess);
      } catch (err, stack) {
        errorBloc
            .add(ErrorHandlerCatched(bloc: this, event: event, error: err));
        print('onCatch $err, $stack');
        yield state.copyWith(status: FormzStatus.submissionFailure);
      }
    }
  }
}
