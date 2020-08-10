import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/exceptions/app_exception.dart';

class ApiBaseHelper {
  final String baseUrl;

  ApiBaseHelper({@required this.baseUrl});

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(baseUrl + url);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(dynamic body, {Function(int, String) onError}) async {
    var responseJson;
    try {
      final response = await http.post(baseUrl, body: body);
      responseJson = _returnResponse(response, onError: onError);
    } on SocketException {
      onError(600, 'No internet connection');
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response, {Function onError}) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        if (responseJson['errors']) {
          print('Error with status code 200');
          onError(200, responseJson['errors']['message']);
          throw UnauthorisedException(responseJson['errors']['message']);
        }
        return responseJson;
      case 400:
        onError(400, 'Bad request');
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        onError(403, 'Not logged in');
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        onError();
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
