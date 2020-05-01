import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/models/enums/activity_level.dart';
import 'package:jumpets_app/models/enums/delivery_status.dart';
import 'package:jumpets_app/models/serializers/serializers.dart';
import 'package:jumpets_app/models/users/user.dart';

part 'reptile_ad.g.dart';

abstract class ReptileAd
    implements AnimalAd, Built<ReptileAd, ReptileAdBuilder> {
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

  ReptileAd._();
  factory ReptileAd([void Function(ReptileAdBuilder) updates]) = _$ReptileAd;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ReptileAd.serializer, this);
  }

  static ReptileAd fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ReptileAd.serializer, json);
  }

  static Serializer<ReptileAd> get serializer => _$reptileAdSerializer;
}
