import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:jumpets_app/models/errors/network_error.dart';

class ApiBaseHelper {
  final String baseUrl;
  final int timeout;

  ApiBaseHelper({this.baseUrl = 'http://192.168.1.48:3030/graphql'})
      : timeout = 500;

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response =
          await http.get(baseUrl + url).timeout(Duration(seconds: timeout));
      responseJson =
          _returnResponse(response.body.toString(), response.statusCode);
    } on SocketException {
      throw FetchDataError(status: 600, msg: 'No internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(dynamic body, {String token}) async {
    var responseJson;
    try {
      final response = await http
          .post(baseUrl,
              headers: {
                'Content-type': 'application/json',
                'Authorization': 'Token $token'
              },
              body: json.encode(body))
          .timeout(Duration(seconds: timeout));
      responseJson =
          _returnResponse(response.body.toString(), response.statusCode);
    } on SocketException {
      throw FetchDataError(status: 600, msg: 'No internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postWithFile(
    dynamic body, {
    String token,
  }) async {
    var responseJson;
    try {
      Dio dio = Dio();
      final response = await dio.post(baseUrl,
          data: body,
          options: Options(headers: {
            'Authorization': 'Token $token',
          }));

      responseJson = _returnResponse(response.data, response.statusCode,
          avoidDecode: true);
    } on SocketException {
      throw FetchDataError(status: 600, msg: 'No internet connection');
    } on DioError catch (e) {
      throw FetchDataError(status: e.response.statusCode, msg: e.message);
    }
    return responseJson;
  }

  dynamic _returnResponse(var response, int statusCode,
      {bool avoidDecode = false}) {
    var responseMap = avoidDecode ? response : json.decode(response);
    switch (statusCode) {
      case 200:
        if (responseMap['errors'] != null) {
          throw FetchDataError(
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
