import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jumpets_app/models/ads/ad.dart';
import 'package:built_collection/built_collection.dart';
import 'package:jumpets_app/models/ads/animals/bird_ad.dart';
import 'package:jumpets_app/models/ads/animals/bunny_ad.dart';
import 'package:jumpets_app/models/ads/animals/cat_ad.dart';
import 'package:jumpets_app/models/ads/animals/dog_ad.dart';
import 'package:jumpets_app/models/ads/animals/fish_ad.dart';
import 'package:jumpets_app/models/ads/animals/other_ad.dart';
import 'package:jumpets_app/models/ads/animals/reptile_ad.dart';
import 'package:jumpets_app/models/ads/animals/rodent_ad.dart';
import 'package:jumpets_app/models/enums/activity_level.dart';
import 'package:jumpets_app/models/enums/delivery_status.dart';
import 'package:jumpets_app/models/users/user.dart';

abstract class AnimalAd implements Ad {
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

  String get name;
  String get description;
  ActivityLevel get activityLevel;
  DateTime get birthDate;
  bool get male;
  double get adoptionTax;
  double get weight;
  BuiltList<String> get personality;

  @nullable
  String get mustKnow;

  @nullable
  BuiltList<DeliveryStatus> get deliveryStatuses;

  @nullable
  String get breed;

  static AnimalAd fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'Dog':
        return DogAd.fromJson(json);
      case 'Cat':
        return CatAd.fromJson(json);
      case 'Bird':
        return BirdAd.fromJson(json);
      case 'Fish':
        return FishAd.fromJson(json);
      case 'Other':
        return OtherAd.fromJson(json);
      case 'Reptile':
        return ReptileAd.fromJson(json);
      case 'Rodent':
        return RodentAd.fromJson(json);
      case 'Bunny':
        return BunnyAd.fromJson(json);
      default:
        throw ArgumentError('Ad did not found __typename in json');
    }
  }
}
