import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:jumpets_app/models/serializers/serializers.dart';
import 'package:jumpets_app/models/users/user.dart';

import '../models.dart';

part 'auth_data.g.dart';

abstract class AuthData implements Built<AuthData, AuthDataBuilder> {
  User get user;

  String get token;

  int get tokenExpiration;

  AuthData._();

  factory AuthData([updates(AuthDataBuilder b)]) = _$AuthData;

  String toJson() {
    return json.encode(serializers.serializeWith(AuthData.serializer, this));
  }

  static AuthData fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AuthData.serializer, json);
  }

  static Serializer<AuthData> get serializer => _$authDataSerializer;
}
