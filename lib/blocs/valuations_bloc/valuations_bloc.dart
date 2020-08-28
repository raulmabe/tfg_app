import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:jumpets_app/blocs/ads_bloc/ads_bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/data/repositories/user_repository.dart';
import 'package:jumpets_app/models/forms/forms.dart';
import 'package:jumpets_app/models/users/user.dart';
import 'package:meta/meta.dart';

part 'valuations_event.dart';
part 'valuations_state.dart';

class ValuationsBloc extends Bloc<ValuationsEvent, ValuationsState> {
  final AuthBloc authBloc;
  final UserRepository repository;
  ValuationsBloc({
    @required this.repository,
    @required this.authBloc,
  })  : assert(repository != null),
        assert(authBloc != null),
        super(ValuationsState());

  @override
  Stream<ValuationsState> mapEventToState(
    ValuationsEvent event,
  ) async* {
    switch (event.runtimeType) {
      case ValuationCommentChanged:
        yield await _mapValuationCommentChangedToState(event);
        break;
      case ValuationValueChanged:
        yield await _mapValuationValueChangedToState(event);
        break;
      case ValuationSubmitted:
        yield* _mapValuationSubmittedToState(event);
        break;
      case ValuationDeleted:
        yield* _mapValuationDeletedToState(event);
        break;
      default:
    }
  }

  Future<ValuationsState> _mapValuationValueChangedToState(
      ValuationValueChanged event) async {
    return state.copyWith(
        value: event.value,
        status: isValueValidParam(event.value)
            ? Formz.validate([state.comment])
            : FormzStatus.invalid);
  }

  Future<ValuationsState> _mapValuationCommentChangedToState(
      ValuationCommentChanged event) async {
    final comment = Comment.dirty(event.comment);
    FormzStatus status = Formz.validate([comment]);
    return state.copyWith(
        comment: comment, status: isValueValid ? status : FormzStatus.invalid);
  }

  bool get isValueValid => state.value >= 0 || state.value > 5;
  bool isValueValidParam(double value) => value >= 0 || value > 5;

  Stream<ValuationsState> _mapValuationSubmittedToState(
    ValuationSubmitted event,
  ) async* {
    if (state.status.isValidated) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      try {
        final user = await repository.valuateUser(
            id: event.id,
            comment: state.comment.value,
            value: state.value,
            token: authBloc.state.authStatus?.authData?.token);

        yield state.copyWith(status: FormzStatus.submissionSuccess, user: user);
      } catch (err, stack) {
        print('onCatch $err, $stack');
        yield state.copyWith(status: FormzStatus.submissionFailure);
      }
    }
  }

  Stream<ValuationsState> _mapValuationDeletedToState(
    ValuationDeleted event,
  ) async* {
    if (state.status.isValidated) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      try {
        final user = await repository.removeValuation(
            id: event.id, token: authBloc.state.authStatus?.authData?.token);

        yield state.copyWith(status: FormzStatus.submissionSuccess, user: user);
      } catch (err, stack) {
        print('onCatch $err, $stack');
        yield state.copyWith(status: FormzStatus.submissionFailure);
      }
    }
  }
}
