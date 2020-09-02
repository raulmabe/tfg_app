part of 'error_handler_bloc.dart';

@immutable
abstract class ErrorHandlerState {}

class ErrorHandlerEmpty extends ErrorHandlerState {}

class ErrorThrownNotification extends ErrorHandlerState {
  final error;
  final VoidCallback retry;
  ErrorThrownNotification(this.error, this.retry);
}

class ErrorThrownDialog extends ErrorHandlerState {
  final error;
  final VoidCallback retry;
  ErrorThrownDialog(this.error, this.retry);
}
