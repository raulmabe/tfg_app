part of 'auth_bloc.dart';

@immutable
class AuthState extends Equatable{
  const AuthState({
    this.authStatus = const AuthStatus.unknown(),
  });

  final AuthStatus authStatus;

  @override
  String toString() {
    return '${authStatus.status}';
  }

  

  @override
  List<Object> get props => [authStatus.status];
}
