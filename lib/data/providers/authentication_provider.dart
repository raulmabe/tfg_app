import 'dart:async';
import 'dart:convert';

import 'package:jumpets_app/models/enums/categories.dart';
import 'package:jumpets_app/data/api_base_helper.dart';
import 'package:jumpets_app/models/enums/user_types.dart';

class AuthenticationProvider {
  final ApiBaseHelper _api;

  AuthenticationProvider() : this._api = ApiBaseHelper();

  Future<dynamic> logIn({String email, String password}) async {
    return _api.post({
      'query': '''{
    login(password: "$password", email: "$email"){
    user {
      id: _id
      name
      email
      thumbnail
      address
      phone
      valuations {
        value
        comment
        author {
          name
        }
      }
      type: __typename
      createdAt
      updatedAt
      ... on Protectora {
        web
      }
      ... on Profesional {
        web
      }
    }
    token
    tokenExpiration
  }
  }'''
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
      id: _id
      name
      email
      thumbnail
      address
      phone
      valuations {
        value
        comment
        author {
          name
        }
      }
      type: __typename
      createdAt
      updatedAt
      ... on Protectora {
        web
      }
      ... on Profesional {
        web
      }
    }
    token
    tokenExpiration
  }
  }'''
    });
  }
}
