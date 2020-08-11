import 'dart:ffi';
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
      final response = await http.post(baseUrl,
          headers: {'Content-type': 'application/json'},
          body: json.encode(body));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataError(status: 600, msg: 'No internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    var responseMap = json.decode(response.body.toString());
    switch (response.statusCode) {
      case 200:
        if (responseMap['errors'] != null) {
          throw UnauthorisedError(
              status: 200, msg: responseMap['errors'][0]['message']);
        }
        return responseMap;
      case 400:
        throw BadRequestError(
            status: 400, msg: responseMap['errors'][0]['message']);
      case 401:
      case 403:
        throw UnauthorisedError(
            status: 403, msg: responseMap['errors'][0]['message']);
      case 500:
      default:
        throw FetchDataError(
            status: -1, msg: responseMap['errors'][0]['message']);
    }
  }
}
