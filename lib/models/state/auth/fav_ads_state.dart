import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jumpets_app/models/ads/ad.dart';
import 'package:jumpets_app/models/serializers/serializers.dart';

part 'fav_ads_state.g.dart';

abstract class FavAdsState implements Built<FavAdsState, FavAdsStateBuilder> {
  @nullable
  BuiltList<Ad> get favAds;
  @nullable
  bool get isLoading;

  factory FavAdsState.initial() {
    return _$FavAdsState._(
      isLoading: false,
    );
  }

  FavAdsState._();
  factory FavAdsState([void Function(FavAdsStateBuilder) updates]) =
      _$FavAdsState;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(FavAdsState.serializer, this);
  }

  static FavAdsState fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(FavAdsState.serializer, json);
  }

  static Serializer<FavAdsState> get serializer => _$favAdsStateSerializer;
}
