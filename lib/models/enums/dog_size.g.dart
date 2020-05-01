// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_size.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DogSize _$BIG = const DogSize._('BIG');
const DogSize _$MEDIUM = const DogSize._('MEDIUM');
const DogSize _$SMALL = const DogSize._('SMALL');

DogSize _$dogSizeValueOf(String name) {
  switch (name) {
    case 'BIG':
      return _$BIG;
    case 'MEDIUM':
      return _$MEDIUM;
    case 'SMALL':
      return _$SMALL;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<DogSize> _$dogSizeValues = new BuiltSet<DogSize>(const <DogSize>[
  _$BIG,
  _$MEDIUM,
  _$SMALL,
]);

Serializer<DogSize> _$dogSizeSerializer = new _$DogSizeSerializer();

class _$DogSizeSerializer implements PrimitiveSerializer<DogSize> {
  @override
  final Iterable<Type> types = const <Type>[DogSize];
  @override
  final String wireName = 'DogSize';

  @override
  Object serialize(Serializers serializers, DogSize object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  DogSize deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DogSize.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
