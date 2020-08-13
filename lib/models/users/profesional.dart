import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jumpets_app/models/serializers/serializers.dart';
import 'package:jumpets_app/models/users/user.dart';
import 'package:jumpets_app/models/users/valuation.dart';

part 'profesional.g.dart';

abstract class Profesional
    implements User, Built<Profesional, ProfesionalBuilder> {
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

  Profesional._();
  factory Profesional([void Function(ProfesionalBuilder) updates]) =
      _$Profesional;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Profesional.serializer, this);
  }

  static Profesional fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Profesional.serializer, json);
  }

  static Serializer<Profesional> get serializer => _$profesionalSerializer;
}
