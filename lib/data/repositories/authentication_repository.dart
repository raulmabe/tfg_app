import 'dart:async';

import 'package:jumpets_app/data/providers/authentication_provider.dart';
import 'package:jumpets_app/models/wrappers/auth_data.dart';
import 'package:meta/meta.dart';

class AuthenticationRepository {
  AuthenticationProvider authenticationProvider = AuthenticationProvider();

  Future<AuthData> logIn({
    @required String email,
    @required String password,
  }) async {
    assert(email != null);
    assert(password != null);

    var json =
        await authenticationProvider.logIn(email: email, password: password);

    return AuthData.fromJson(json['data']['login']);
  }
}
