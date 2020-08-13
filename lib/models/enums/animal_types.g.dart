// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_types.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AnimalType _$DOG = const AnimalType._('DOG');
const AnimalType _$CAT = const AnimalType._('CAT');
const AnimalType _$BUNNY = const AnimalType._('BUNNY');
const AnimalType _$REPTILE = const AnimalType._('REPTILE');
const AnimalType _$OTHER = const AnimalType._('OTHER');
const AnimalType _$BIRD = const AnimalType._('BIRD');
const AnimalType _$RODENT = const AnimalType._('RODENT');
const AnimalType _$FISH = const AnimalType._('FISH');

AnimalType _$animalTypeValueOf(String name) {
  switch (name) {
    case 'DOG':
      return _$DOG;
    case 'CAT':
      return _$CAT;
    case 'BUNNY':
      return _$BUNNY;
    case 'REPTILE':
      return _$REPTILE;
    case 'OTHER':
      return _$OTHER;
    case 'BIRD':
      return _$BIRD;
    case 'RODENT':
      return _$RODENT;
    case 'FISH':
      return _$FISH;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<AnimalType> _$animalTypeValues =
    new BuiltSet<AnimalType>(const <AnimalType>[
  _$DOG,
  _$CAT,
  _$BUNNY,
  _$REPTILE,
  _$OTHER,
  _$BIRD,
  _$RODENT,
  _$FISH,
]);

Serializer<AnimalType> _$animalTypeSerializer = new _$AnimalTypeSerializer();

class _$AnimalTypeSerializer implements PrimitiveSerializer<AnimalType> {
  @override
  final Iterable<Type> types = const <Type>[AnimalType];
  @override
  final String wireName = 'AnimalType';

  @override
  Object serialize(Serializers serializers, AnimalType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  AnimalType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AnimalType.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
