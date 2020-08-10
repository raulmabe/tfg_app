import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:jumpets_app/models/serializers/serializers.dart';
import 'package:jumpets_app/models/state/auth/auth_state.dart';
import 'package:jumpets_app/models/wrappers/page_info.dart';

import '../models.dart';

part 'paginated_ads.g.dart';

abstract class PaginatedAds
    implements Built<PaginatedAds, PaginatedAdsBuilder> {
  BuiltList<Ad> get ads;
  PageInfo get pageInfo;

  PaginatedAds._();

  factory PaginatedAds([updates(PaginatedAdsBuilder b)]) = _$PaginatedAds;

  String toJson() {
    return json
        .encode(serializers.serializeWith(PaginatedAds.serializer, this));
  }

  static PaginatedAds fromJson(String jsonString) {
    return serializers.deserializeWith(
        PaginatedAds.serializer, json.decode(jsonString));
  }

  static Serializer<PaginatedAds> get serializer => _$paginatedAdsSerializer;
}
