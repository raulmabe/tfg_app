import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/models/ads/product_ad.dart';
import 'package:jumpets_app/models/ads/service_ad.dart';
import 'package:jumpets_app/models/enums/categories.dart';
import 'package:jumpets_app/models/serializers/serializers.dart';
import 'package:jumpets_app/models/users/protectora.dart';

part 'ads_state.g.dart';

abstract class AdsState implements Built<AdsState, AdsStateBuilder> {
  BuiltList<AnimalAd> get animalAds;
  BuiltList<ServiceAd> get serviceAds;
  BuiltList<ProductAd> get productAds;

  BuiltList<Protectora> get protectoraAds;

  Category get selectedCategory;

  factory AdsState.initial() {
    return _$AdsState._(
        animalAds: BuiltList([]),
        protectoraAds: BuiltList([]),
        selectedCategory: Category.DOGS);
  }

  AdsState._();
  factory AdsState([void Function(AdsStateBuilder) updates]) = _$AdsState;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AdsState.serializer, this);
  }

  static AdsState fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AdsState.serializer, json);
  }

  static Serializer<AdsState> get serializer => _$adsStateSerializer;
}
