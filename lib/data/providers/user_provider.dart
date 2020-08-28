import 'dart:async';

import 'package:jumpets_app/data/api_base_helper.dart';
import 'package:jumpets_app/models/enums/user_types.dart';

class UserProvider {
  final ApiBaseHelper _api;

  UserProvider() : this._api = ApiBaseHelper();

  static String getUserFragment() {
    return '''
    fragment userFields on User {
      id: _id
      type: __typename
      thumbnail
      name
      address
      email
      phone
      ... on Protectora {
        web
      }
      ... on Profesional {
        web
      }
      createdAt
      updatedAt
      valuations {
        author {
          id: _id
          type: __typename
          thumbnail
          name
          address
          email
          phone
          ... on Protectora {
            web
          }
          ... on Profesional {
            web
          }
          createdAt
          updatedAt
        }
        value
        comment
        updatedAt
        createdAt
      }
    }
    ''';
  }

  Future<dynamic> getUser({
    String id,
  }) async {
    return _api.post({
      'query': '''
       {
          getUser(id: "$id") {
            ...userFields
          }
        }
      ''' +
          getUserFragment()
    });
  }

  Future<dynamic> updateUser(
      {String name,
      String email,
      String address,
      int phone,
      thumbnail,
      String web,
      String password,
      String token}) async {
    String nameEscaped = name != null ? '"$name"' : null;
    String addressEscaped = address != null ? '"$address"' : null;
    String emailEscaped = email != null ? '"$email"' : null;
    String passwordEscaped = password != null ? '"$password"' : null;
    String webEscaped = web != null ? '"$web"' : null;

    return _api.post({
      'query': '''
       mutation{
          updateUser(
            userInput: {
              name: $nameEscaped
              web: $webEscaped
              email: $emailEscaped
              phone: $phone
              password: $passwordEscaped
              address: $addressEscaped
            }
          ) {
            ...userFields
          }
        }
      ''' +
          getUserFragment()
    }, token: token);
  }

  Future<dynamic> valuateUser(
      {String id, String comment, double value, token}) async {
    return _api.post({
      'query': '''
      mutation {
  valuateUser(
    input: {
      userId: "$id",
      value: $value,
      comment: "$comment"
    }
  ) {
    ...userFields
          }
          }
      ''' +
          getUserFragment()
    }, token: token);
  }

  Future<dynamic> removeValuation({String id, String token}) async {
    return _api.post({
      'query': '''
      mutation {
  removeValuation(
    id: "$id"
  ) {
    ...userFields
          }
          }
      ''' +
          getUserFragment()
    }, token: token);
  }
}
