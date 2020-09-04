part of 'error_handler_bloc.dart';

@immutable
abstract class ErrorHandlerEvent {}

class ErrorHandlerCatched extends ErrorHandlerEvent {
  final Bloc bloc;
  final event;
  final NetworkError error;
  final bool notification;
  ErrorHandlerCatched(
      {this.bloc, this.error, this.event, this.notification = false});
}
