import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightTheme());

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    switch (event.runtimeType) {
      case LightModeEnabled:
        yield LightTheme();
        break;
      case DarkModeEnabled:
        yield DarkTheme();
        break;
      default:
    }
  }

  @override
  ThemeState fromJson(Map<String, dynamic> json) =>
      json['lightTheme'] as bool ? LightTheme() : DarkTheme();

  @override
  Map<String, bool> toJson(ThemeState state) =>
      {'lightTheme': state is LightTheme ? true : false};
}
