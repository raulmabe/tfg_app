import 'dart:async';

import 'package:jumpets_app/data/api_base_helper.dart';
import 'package:jumpets_app/data/providers/user_provider.dart';
import 'package:jumpets_app/models/enums/user_types.dart';

class AuthenticationProvider {
  final ApiBaseHelper _api;

  AuthenticationProvider() : this._api = ApiBaseHelper();

  Future<dynamic> logIn({String email, String password}) async {
    return _api.post({
      'query': '''{
    login(password: "$password", email: "$email"){
    user {
      ...userFields
    }
    token
    tokenExpiration
  }
  }''' +
          UserProvider.getUserFragment
    });
  }

  Future<dynamic> register(
      {String email, String password, UserType type, String name}) async {
    return _api.post({
      'query': '''mutation {
    register: createUser(userInput: {
      password: "$password", email: "$email", type: $type, name: "$name"
    }){
    user {
      ...userFields
    }
    token
    tokenExpiration
  }
  }''' +
          UserProvider.getUserFragment
    });
  }
}
