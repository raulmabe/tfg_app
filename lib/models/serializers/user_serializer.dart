import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:jumpets_app/models/users/protectora.dart';
import 'package:jumpets_app/models/users/user.dart';

class UserSerializer implements StructuredSerializer<User> {
  @override
  User deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    List list = List.from(serialized);

    if (list.length.isOdd) {
      throw ArgumentError('Serialized list is odd');
    }

    var map = <String, dynamic>{};
    for (var i = 0; i < list.length; i += 2) {
      map[list[i]] = list[i + 1];
    }

    return User.fromJson(map);
  }

  @override
  Iterable serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    throw UnsupportedError('Tried to serialize an User instance');
  }

  @override
  // TODO: implement types
  Iterable<Type> get types => [User];

  @override
  // TODO: implement wireName
  String get wireName => 'User';
}
