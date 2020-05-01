import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jumpets_app/models/ads/ad.dart';
import 'package:jumpets_app/models/serializers/serializers.dart';
import 'package:jumpets_app/models/users/user.dart';

part 'particular.g.dart';

abstract class Particular
    implements User, Built<Particular, ParticularBuilder> {
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

  BuiltList<Ad> get preferredAds;

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
