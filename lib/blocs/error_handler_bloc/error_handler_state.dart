part of 'error_handler_bloc.dart';

@immutable
abstract class ErrorHandlerState {}

class ErrorHandlerEmpty extends ErrorHandlerState {}

class ErrorThrownSnackbar extends ErrorHandlerState {
  final error;
  final VoidCallback retry;
  ErrorThrownSnackbar(this.error, this.retry);
}

class ErrorThrownDialog extends ErrorHandlerState {
  final error;
  final VoidCallback retry;
  ErrorThrownDialog(this.error, this.retry);
}
