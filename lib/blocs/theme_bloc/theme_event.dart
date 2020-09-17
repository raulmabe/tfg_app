part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class DarkModeEnabled extends ThemeEvent {}

class LightModeEnabled extends ThemeEvent {}

/* class BlackModeEnabled extends ThemeEvent {} */
