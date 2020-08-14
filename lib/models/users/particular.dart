import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jumpets_app/models/ads/ad.dart';
import 'package:jumpets_app/models/serializers/serializers.dart';
import 'package:jumpets_app/models/users/user.dart';
import 'package:jumpets_app/models/users/valuation.dart';

part 'particular.g.dart';

abstract class Particular
    implements User, Built<Particular, ParticularBuilder> {
  @override
  String get id;

  @override
  String get name;

  @override
  @nullable
  String get thumbnail;

  @override
  @nullable
  String get address;

  @override
  @nullable
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

  Particular._();
  factory Particular([void Function(ParticularBuilder) updates]) = _$Particular;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Particular.serializer, this);
  }

  static Particular fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Particular.serializer, json);
  }

  static Serializer<Particular> get serializer => _$particularSerializer;
}
