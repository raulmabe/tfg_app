import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'locale_event.dart';
part 'locale_state.dart';

class LocaleBloc extends HydratedBloc<LocaleEvent, LocaleState> {
  LocaleBloc(String locale) : super(LocaleState(locale));

  @override
  Stream<LocaleState> mapEventToState(
    LocaleEvent event,
  ) async* {
    if (event is LocaleChanged) {
      yield LocaleState(event.code);
    }
  }

  @override
  LocaleState fromJson(Map<String, dynamic> json) =>
      LocaleState(json['locale'] as String);

  @override
  Map<String, String> toJson(LocaleState state) => {'locale': state.code};
}
