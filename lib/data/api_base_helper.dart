import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:jumpets_app/errors/network_error.dart';

class ApiBaseHelper {
  final String baseUrl;

  ApiBaseHelper({@required this.baseUrl});

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(baseUrl + url);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataError(status: 600, msg: 'No internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(dynamic body) async {
    var responseJson;
    try {
      final response = await http.post(baseUrl, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataError(status: 600, msg: 'No internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        if (responseJson['errors']) {
          throw UnauthorisedError(
              status: 200, msg: responseJson['errors']['message']);
        }
        return responseJson;
      case 400:
        throw BadRequestError(status: 400, msg: '');
      case 401:
      case 403:
        throw UnauthorisedError(status: 403, msg: '');
      case 500:
      default:
        throw FetchDataError(status: -1, msg: '');
    }
  }
}
