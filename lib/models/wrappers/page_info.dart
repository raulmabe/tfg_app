import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:jumpets_app/models/serializers/serializers.dart';

import '../models.dart';

part 'page_info.g.dart';

abstract class PageInfo implements Built<PageInfo, PageInfoBuilder> {
  @nullable
  String get endCursor;
  @nullable
  String get startCursor;

  bool get hasNextPage;
  bool get hasPreviousPage;

  PageInfo._();

  factory PageInfo([updates(PageInfoBuilder b)]) = _$PageInfo;

  String toJson() {
    return json.encode(serializers.serializeWith(PageInfo.serializer, this));
  }

  static PageInfo fromJson(String jsonString) {
    return serializers.deserializeWith(
        PageInfo.serializer, json.decode(jsonString));
  }

  static Serializer<PageInfo> get serializer => _$pageInfoSerializer;
}
