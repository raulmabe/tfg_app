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

  Future<dynamic> post(dynamic body, {Function onError}) async {
    var responseJson;
    try {
      final response = await http.post(baseUrl, body: body);
      responseJson = _returnResponse(response, onError: onError);
    } on SocketException {
      onError();
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response, {Function onError}) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        onError();
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        onError();
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        onError();
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
