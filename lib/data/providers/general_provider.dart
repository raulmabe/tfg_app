import 'dart:async';

import 'package:jumpets_app/data/api_base_helper.dart';

class GeneralProvider {
  final ApiBaseHelper _api;

  GeneralProvider() : this._api = ApiBaseHelper();

  Future<dynamic> getInfo({String email, String password}) async {
    return _api.post({
      'query': '''{
        info {
          title
          msg
          url
        }
  }'''
    });
  }
}
