import 'dart:async';

import 'package:jumpets_app/data/providers/authentication_provider.dart';
import 'package:jumpets_app/models/enums/user_types.dart';
import 'package:jumpets_app/models/wrappers/auth_data.dart';
import 'package:jumpets_app/models/wrappers/auth_status.dart';
import 'package:meta/meta.dart';

class AuthenticationRepository {
  final _controller = StreamController<AuthStatus>();
  AuthenticationProvider authenticationProvider = AuthenticationProvider();

  Stream<AuthStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthStatus.unknown();
    yield* _controller.stream;
  }

  Future<AuthData> logIn({
    @required String email,
    @required String password,
  }) async {
    assert(email != null);
    assert(password != null);

    var json = await authenticationProvider.logIn(
        email: email.trim(), password: password.trim());

    AuthData auth = AuthData.fromJson(json['data']['login']);

    _controller.add(AuthStatus.authenticated(auth));
    return auth;
  }

  Future<AuthData> register(
      {@required String email,
      @required String password,
      @required UserType type,
      @required String name}) async {
    assert(email != null);
    assert(password != null);
    assert(type != null);
    assert(name != null);

    var json = await authenticationProvider.register(
        email: email.trim(),
        password: password.trim(),
        type: type,
        name: name.trim());

    AuthData auth = AuthData.fromJson(json['data']['register']);

    _controller.add(AuthStatus.authenticated(auth));
    return auth;
  }

  void logOut() {
    _controller.add(AuthStatus.unauthenticated());
  }

  void dispose() => _controller.close();
}
