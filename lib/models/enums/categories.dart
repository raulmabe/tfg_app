import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jumpets_app/models/serializers/serializers.dart';

part 'categories.g.dart';

class Category extends EnumClass {
  static const Category DOGS = _$DOGS;
  static const Category CATS = _$CATS;
  static const Category BUNNIES = _$BUNNIES;
  static const Category REPTILES = _$REPTILES;
  static const Category OTHERS = _$OTHERS;
  static const Category BIRDS = _$BIRDS;
  static const Category RODENTS = _$RODENTS;
  static const Category FISHES = _$FISHES;

  static const Category PRODUCTS = _$PRODUCTS;
  static const Category SERVICES = _$SERVICES;
/*   static const Category VETS = _$VETS; */
  static const Category SHELTERS = _$SHELTERS;

  const Category._(String name) : super(name);

  static BuiltSet<Category> get values => _$categoryValues;
  static Category valueOf(String name) => _$categoryValueOf(name);

  String serialize() {
    return serializers.serializeWith(Category.serializer, this);
  }

  static Category deserialize(String string) {
    return serializers.deserializeWith(Category.serializer, string);
  }

  static Serializer<Category> get serializer => _$categorySerializer;
}
