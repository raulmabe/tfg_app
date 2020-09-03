import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:jumpets_app/blocs/info_handler_bloc/info_handler_bloc.dart';
import 'package:jumpets_app/data/repositories/user_repository.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:meta/meta.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final UserRepository repository;
  final AuthBloc authBloc;
  final ErrorHandlerBloc errorBloc;
  final InfoHandlerBloc infoBloc;

  EditProfileBloc(
      {@required this.repository,
      @required this.authBloc,
      @required User user,
      @required this.errorBloc,
      @required this.infoBloc})
      : assert(authBloc != null),
        assert(errorBloc != null),
        assert(infoBloc != null),
        super(EditProfileState(
          email: Email.pure(user.email),
          name: Name.pure(user.name),
          address: Address.pure(user.address),
          web: Web.pure(user is Profesional
              ? user.web
              : user is Protectora ? user.web : ''),
          phone: Phone.pure(user.phone),
        ));

  @override
  Stream<EditProfileState> mapEventToState(
    EditProfileEvent event,
  ) async* {
    switch (event.runtimeType) {
      case ProfileEmailChanged:
        yield _mapProfileEmailChangedToState(event);
        break;
      case ProfileNameChanged:
        yield _mapProfileNameChangedToState(event);
        break;
      case ProfileAddressChanged:
        yield _mapProfileAddressChangedToState(event);
        break;
      case ProfileWebChanged:
        yield _mapProfileWebChangedToState(event);
        break;
      case ProfilePhoneChanged:
        yield _mapProfilePhoneChangedToState(event);
        break;
      case ProfilePasswordChanged:
        yield _mapProfilePasswordChangedToState(event);
        break;
      case ProfileImgChanged:
        yield _mapProfileImgChangedToState(event);
        break;
      case ProfileEditSubmitted:
        yield* _mapProfileSubmittedChangedToState(event);
        break;
      default:
    }
  }

  EditProfileState _mapProfileWebChangedToState(
    ProfileWebChanged event,
  ) {
    final web = Web.dirty(event.web);
    return state.copyWith(
        web: web,
        status: Formz.validate([
          state.password,
          state.email,
          web,
          state.name,
          state.address,
          state.phone,
        ]));
  }

  EditProfileState _mapProfilePhoneChangedToState(
    ProfilePhoneChanged event,
  ) {
    final phone = Phone.dirty(event.phone);
    return state.copyWith(
        phone: phone,
        status: Formz.validate([
          state.password,
          state.email,
          phone,
          state.name,
          state.address,
          state.web,
        ]));
  }

  EditProfileState _mapProfileAddressChangedToState(
    ProfileAddressChanged event,
  ) {
    final address = Address.dirty(event.address);
    return state.copyWith(
        address: address,
        status: Formz.validate([
          state.password,
          state.email,
          address,
          state.name,
          state.phone,
          state.web,
        ]));
  }

  EditProfileState _mapProfileNameChangedToState(
    ProfileNameChanged event,
  ) {
    final name = Name.dirty(event.name);
    return state.copyWith(
        name: name,
        status: Formz.validate([
          state.password,
          state.email,
          name,
          state.address,
          state.phone,
          state.web,
        ]));
  }

  EditProfileState _mapProfileEmailChangedToState(
    ProfileEmailChanged event,
  ) {
    final email = Email.dirty(event.email);
    FormzStatus status = Formz.validate([
      state.password,
      email,
      state.name,
      state.address,
      state.phone,
      state.web,
    ]);

    return state.copyWith(email: email, status: status);
  }

  EditProfileState _mapProfileImgChangedToState(
    ProfileImgChanged event,
  ) {
    return state.copyWith(
        file: event.file,
        status: Formz.validate([
          state.password,
          state.email,
          state.name,
          state.address,
          state.phone,
          state.web,
        ]));
  }

  EditProfileState _mapProfilePasswordChangedToState(
    ProfilePasswordChanged event,
  ) {
    final password = PasswordNullable.dirty(event.password);
    return state.copyWith(
        password: password,
        status: Formz.validate([
          password,
          state.email,
          state.name,
          state.address,
          state.phone,
          state.web,
        ]));
  }

  Stream<EditProfileState> _mapProfileSubmittedChangedToState(
    ProfileEditSubmitted event,
  ) async* {
    if (state.status.isValidated || state.status.isPure && state.file != null) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      try {
        // Si no ha modificado estos valores, se envían como null
        String password;
        if (state.password.value.isNotEmpty) {
          password = state.password.value;
        }

        String email;
        if (state.email.value !=
            authBloc.state.authStatus?.authData?.user?.email) {
          email = state.email.value;
        }

        User user = await repository.updateUser(
            file: state.file,
            email: email,
            password: password,
            web: state.web.value,
            phone: state.phone.value,
            address: state.address.value,
            name: state.name.value,
            token: authBloc.state.authStatus?.authData?.token);

        authBloc.add(AuthUserUpdated(user));

        yield state.copyWith(status: FormzStatus.submissionSuccess);

        infoBloc
            .add(MessageAdded(msg: 'uploading_background', notification: true));
      } catch (err, stack) {
        errorBloc
            .add(ErrorHandlerCatched(bloc: this, event: event, error: err));
        print('onCatch $err, $stack');
        yield state.copyWith(status: FormzStatus.submissionFailure);
      }
    }
  }
}
