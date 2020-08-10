import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jumpets_app/models/ads/ad.dart';
import 'package:jumpets_app/models/serializers/serializers.dart';
import 'package:jumpets_app/models/users/user.dart';

part 'product_ad.g.dart';

abstract class ProductAd implements Ad, Built<ProductAd, ProductAdBuilder> {
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

  String get title;
  double get price;

  String get description;

  ProductAd._();
  factory ProductAd([void Function(ProductAdBuilder) updates]) = _$ProductAd;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ProductAd.serializer, this);
  }

  static ProductAd fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ProductAd.serializer, json);
  }

  static Serializer<ProductAd> get serializer => _$productAdSerializer;
}
