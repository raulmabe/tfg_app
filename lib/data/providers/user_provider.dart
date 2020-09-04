import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:jumpets_app/data/api_base_helper.dart';
import 'package:jumpets_app/data/providers/ads_provider.dart';
import 'package:jumpets_app/data/repositories/ads_repository.dart';
import 'package:jumpets_app/models/enums/user_types.dart';
import 'dart:convert';

class UserProvider {
  final ApiBaseHelper _api;

  UserProvider() : this._api = ApiBaseHelper();

  static String get getUserFragment {
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
          getUserFragment
    });
  }

  Future<dynamic> updateUser(
      {String name,
      File file,
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

    var operations = {
      'query': '''
       mutation(\$file: Upload) {
          updateUser(
            userInput: {
              name: $nameEscaped
              web: $webEscaped
              email: $emailEscaped
              phone: $phone
              password: $passwordEscaped
              address: $addressEscaped
              thumbnail: \$file
            }
          ) {
            ...userFields
          }
        }
      ''' +
          getUserFragment,
      'variables': {'file': null}
    };

    if (file != null) {
      FormData formData = FormData.fromMap({
        'operations': json.encode(operations),
        'map': json.encode({
          '0': ['variables.file']
        }),
        "0": await MultipartFile.fromFile(file.path,
            contentType: MediaType('image', file.path.split('.').last)),
      });

      return _api.postWithFile(formData, token: token);
    } else
      return _api.post(operations, token: token);
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
          getUserFragment
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
          getUserFragment
    }, token: token);
  }

  Future<dynamic> getRooms({String token}) async {
    return _api.post({
      'query': '''
       {
          myRooms {
            id: _id
            user1 {
              ...userFields
            }
            user2 {
              ...userFields
            }
            messages {
              id: _id
              text
              ad {
                ...adFields
              }
              sender {
                ...userFields
              }
              createdAt
              updatedAt
            }
            createdAt
            updatedAt
          }
        }
      ''' +
          AdsProvider.adFragment
    }, token: token);
  }

  Future<dynamic> sendMessage(
      {String userId, String adId, String text, String token}) async {
    String adIdEscaped = adId != null ? '"$adId"' : null;

    return _api.post({
      'query': '''
       mutation{
          createMessage(
            toUser: "$userId"
            text: "$text"
            ad: $adIdEscaped
          ) {
              id: _id
            user1 {
              ...userFields
            }
            user2 {
              ...userFields
            }
            messages {
              id: _id
              text
              ad {
                ...adFields
              }
              sender {
                ...userFields
              }
              createdAt
              updatedAt
            }
            createdAt
            updatedAt
          }
        }
      ''' +
          AdsProvider.adFragment
    }, token: token);
  }
}
