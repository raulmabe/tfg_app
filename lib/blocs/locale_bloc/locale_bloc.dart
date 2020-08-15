import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'locale_event.dart';
part 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc(String locale) : super(LocaleState(locale));

  @override
  Stream<LocaleState> mapEventToState(
    LocaleEvent event,
  ) async* {
    if (event is LocaleChanged) {
      yield LocaleState(event.code);
    }
  }
}
