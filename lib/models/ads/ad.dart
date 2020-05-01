import 'package:built_collection/built_collection.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/models/ads/product_ad.dart';
import 'package:jumpets_app/models/ads/service_ad.dart';
import 'package:jumpets_app/models/users/user.dart';

abstract class Ad {
  String get id;
  DateTime get date;
  BuiltList<String> get tags;
  BuiltList<String> get photos;
  User get owner;

  static Ad fromJson(Map<String, dynamic> json) {
    switch (json['__typename']) {
      case 'ProductAd':
        return ProductAd.fromJson(json);
      case 'ServiceAd':
        return ServiceAd.fromJson(json);
      default:
        return AnimalAd.fromJson(json);
    }
  }
}
