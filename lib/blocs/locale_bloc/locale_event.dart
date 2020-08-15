part of 'locale_bloc.dart';

@immutable
abstract class LocaleEvent {}

class LocaleChanged extends LocaleEvent {
  final String code;
  LocaleChanged(this.code);

  @override
  String toString() {
    return 'LocaleChanged $code';
  }
}
