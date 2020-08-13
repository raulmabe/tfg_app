import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jumpets_app/models/serializers/user_serializer.dart';
import 'package:jumpets_app/models/users/particular.dart';
import 'package:jumpets_app/models/users/profesional.dart';
import 'package:jumpets_app/models/users/protectora.dart';
import 'package:jumpets_app/models/users/valuation.dart';
import 'package:built_collection/built_collection.dart';

abstract class User {
  String get id;
  String get name;
  String get thumbnail;
  String get address;
  int get phone;
  String get email;
  @nullable
  String get password;

  DateTime get createdAt;
  DateTime get updatedAt;

  @nullable
  BuiltList<Valuation> get valuations;

  static User fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'Particular':
        return Particular.fromJson(json);
      case 'Protectora':
        return Protectora.fromJson(json);
      case 'Profesional':
        return Profesional.fromJson(json);
      default:
        throw ArgumentError('User did not found __typename in json');
    }
  }

  @BuiltValueSerializer(custom: true)
  static Serializer<User> get serializer => UserSerializer();
}
