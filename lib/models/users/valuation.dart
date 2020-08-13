import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:jumpets_app/models/serializers/serializers.dart';
import 'package:jumpets_app/models/users/user.dart';

import '../models.dart';

part 'valuation.g.dart';

abstract class Valuation implements Built<Valuation, ValuationBuilder> {
  User get author;

  String get comment;

  double get value;

  Valuation._();

  factory Valuation([updates(ValuationBuilder b)]) = _$Valuation;

  String toJson() {
    return json.encode(serializers.serializeWith(Valuation.serializer, this));
  }

  static Valuation fromJson(String jsonString) {
    return serializers.deserializeWith(
        Valuation.serializer, json.decode(jsonString));
  }

  static Serializer<Valuation> get serializer => _$valuationSerializer;
}
