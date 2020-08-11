import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/models/enums/activity_level.dart';
import 'package:jumpets_app/models/enums/delivery_status.dart';
import 'package:jumpets_app/models/serializers/serializers.dart';
import 'package:jumpets_app/models/users/user.dart';

part 'bird_ad.g.dart';

abstract class BirdAd implements AnimalAd, Built<BirdAd, BirdAdBuilder> {
  @override
  String get id;

  @override
  DateTime get createdAt;

  @override
  BuiltList<String> get tags;

  @override
  BuiltList<String> get photos;

  @override
  User get creator;

  @override
  String get name;

  @override
  String get description;

  @override
  ActivityLevel get activityLevel;

  @override
  DateTime get birthDate;

  @override
  bool get male;

  @override
  double get adoptionTax;

  @override
  double get weight;

  @override
  BuiltList<String> get personality;

  @override
  @nullable
  String get mustKnow;

  @nullable
  @override
  BuiltList<DeliveryStatus> get deliveryStatuses;

  @nullable
  @override
  String get breed;

  BirdAd._();
  factory BirdAd([void Function(BirdAdBuilder) updates]) = _$BirdAd;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(BirdAd.serializer, this);
  }

  static BirdAd fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(BirdAd.serializer, json);
  }

  static Serializer<BirdAd> get serializer => _$birdAdSerializer;
}
