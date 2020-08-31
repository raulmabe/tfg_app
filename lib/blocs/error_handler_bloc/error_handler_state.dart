part of 'error_handler_bloc.dart';

@immutable
abstract class ErrorHandlerState {}

class ErrorHandlerEmpty extends ErrorHandlerState {}

class ErrorThrownSnackbar extends ErrorHandlerState {
  final error;
  ErrorThrownSnackbar(this.error);
}

class ErrorThrownDialog extends ErrorHandlerState {
  final error;
  final VoidCallback retry;
  ErrorThrownDialog(this.error, this.retry);
}
