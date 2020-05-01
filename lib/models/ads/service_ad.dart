import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jumpets_app/models/ads/ad.dart';
import 'package:jumpets_app/models/serializers/serializers.dart';
import 'package:jumpets_app/models/users/user.dart';

part 'service_ad.g.dart';

abstract class ServiceAd implements Ad, Built<ServiceAd, ServiceAdBuilder> {
  @override
  String get id;

  @override
  DateTime get date;

  @override
  BuiltList<String> get tags;

  @override
  BuiltList<String> get photos;

  @override
  User get owner;

  String get title;
  double get priceHour;

  String get description;

  ServiceAd._();
  factory ServiceAd([void Function(ServiceAdBuilder) updates]) = _$ServiceAd;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ServiceAd.serializer, this);
  }

  static ServiceAd fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ServiceAd.serializer, json);
  }

  static Serializer<ServiceAd> get serializer => _$serviceAdSerializer;
}
