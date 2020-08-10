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
  User get creator;

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

  BuiltList<DeliveryStatus> get deliveryInfo;

  String get breed;

  static AnimalAd fromJson(Map<String, dynamic> json) {
    var fromJson = CatAd.fromJson(json);
    switch (json['type'].toString().toUpperCase()) {
      case "DOG":
        return DogAd.fromJson(json);
      case "CAT":
        return fromJson;
      case "BIRD":
        return BirdAd.fromJson(json);
      case "FISH":
        return FishAd.fromJson(json);
      case "OTHER":
        return OtherAd.fromJson(json);
      case "REPTILE":
        return ReptileAd.fromJson(json);
      case "RODENT":
        return RodentAd.fromJson(json);
      case "BUNNY":
        return BunnyAd.fromJson(json);
      default:
        throw ArgumentError('Ad did not found type in json');
    }
  }
}
