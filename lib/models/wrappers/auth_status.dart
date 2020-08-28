import 'package:jumpets_app/models/wrappers/auth_data.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthStatus {
  final AuthData authData;
  final AuthenticationStatus status;

  const AuthStatus._(this.authData, this.status);

  const AuthStatus.unknown() : this._(null, AuthenticationStatus.unknown);
  const AuthStatus.authenticated(AuthData authdata)
      : this._(authdata, AuthenticationStatus.authenticated);
  const AuthStatus.unauthenticated()
      : this._(null, AuthenticationStatus.unauthenticated);

  AuthStatus copyWith({AuthData authData, AuthenticationStatus status}) {
    return AuthStatus._(authData ?? this.authData, status ?? this.status);
  }
}
