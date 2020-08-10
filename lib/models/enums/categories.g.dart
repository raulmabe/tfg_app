// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const Category _$DOGS = const Category._('DOGS');
const Category _$CATS = const Category._('CATS');
const Category _$BUNNIES = const Category._('BUNNIES');
const Category _$REPTILES = const Category._('REPTILES');
const Category _$OTHERS = const Category._('OTHERS');
const Category _$BIRDS = const Category._('BIRDS');
const Category _$RODENTS = const Category._('RODENTS');
const Category _$FISHES = const Category._('FISHES');
const Category _$PRODUCTS = const Category._('PRODUCTS');
const Category _$SERVICES = const Category._('SERVICES');
const Category _$SHELTERS = const Category._('SHELTERS');

Category _$categoryValueOf(String name) {
  switch (name) {
    case 'DOGS':
      return _$DOGS;
    case 'CATS':
      return _$CATS;
    case 'BUNNIES':
      return _$BUNNIES;
    case 'REPTILES':
      return _$REPTILES;
    case 'OTHERS':
      return _$OTHERS;
    case 'BIRDS':
      return _$BIRDS;
    case 'RODENTS':
      return _$RODENTS;
    case 'FISHES':
      return _$FISHES;
    case 'PRODUCTS':
      return _$PRODUCTS;
    case 'SERVICES':
      return _$SERVICES;
    case 'SHELTERS':
      return _$SHELTERS;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<Category> _$categoryValues =
    new BuiltSet<Category>(const <Category>[
  _$DOGS,
  _$CATS,
  _$BUNNIES,
  _$REPTILES,
  _$OTHERS,
  _$BIRDS,
  _$RODENTS,
  _$FISHES,
  _$PRODUCTS,
  _$SERVICES,
  _$SHELTERS,
]);

Serializer<Category> _$categorySerializer = new _$CategorySerializer();

class _$CategorySerializer implements PrimitiveSerializer<Category> {
  @override
  final Iterable<Type> types = const <Type>[Category];
  @override
  final String wireName = 'Category';

  @override
  Object serialize(Serializers serializers, Category object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  Category deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      Category.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
