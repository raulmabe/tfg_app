part of 'auth_bloc.dart';

@immutable
class AuthState {
  const AuthState({
    this.authStatus = const AuthStatus.unknown(),
  });

  final AuthStatus authStatus;

  @override
  String toString() {
    return '${authStatus.status}';
  }
}
