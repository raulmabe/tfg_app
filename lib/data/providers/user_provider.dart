import 'dart:async';

import 'package:jumpets_app/data/api_base_helper.dart';
import 'package:jumpets_app/models/enums/user_types.dart';

class UserProvider {
  final ApiBaseHelper _api;

  UserProvider() : this._api = ApiBaseHelper();

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
          }
      '''
    }, token: token);
  }

  Future<dynamic> removeValuation({String id, String token}) async {
    return _api.post({
      'query': '''
      mutation {
  removeValuation(
    id: "$id"
  ) {
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
          }
      '''
    }, token: token);
  }
}
