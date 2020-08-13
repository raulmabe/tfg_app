import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jumpets_app/models/serializers/serializers.dart';
import 'package:jumpets_app/models/users/user.dart';
import 'package:jumpets_app/models/users/valuation.dart';

part 'protectora.g.dart';

abstract class Protectora
    implements User, Built<Protectora, ProtectoraBuilder> {
  @override
  String get id;

  @override
  String get name;

  @override
  String get thumbnail;

  @override
  String get address;

  @override
  int get phone;

  @override
  String get email;

  @override
  @nullable
  String get password;

  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  @override
  @nullable
  BuiltList<Valuation> get valuations;

  @nullable
  String get web;

  @nullable
  int get distance;

  @nullable
  int get travelTime;

  Protectora._();
  factory Protectora([void Function(ProtectoraBuilder) updates]) = _$Protectora;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Protectora.serializer, this);
  }

  static Protectora fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Protectora.serializer, json);
  }

  static Serializer<Protectora> get serializer => _$protectoraSerializer;
}
