// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_types.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const UserType _$PROTECTORA = const UserType._('PROTECTORA');
const UserType _$PROFESIONAL = const UserType._('PROFESIONAL');
const UserType _$PARTICULAR = const UserType._('PARTICULAR');

UserType _$userTypeValueOf(String name) {
  switch (name) {
    case 'PROTECTORA':
      return _$PROTECTORA;
    case 'PROFESIONAL':
      return _$PROFESIONAL;
    case 'PARTICULAR':
      return _$PARTICULAR;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<UserType> _$userTypeValues =
    new BuiltSet<UserType>(const <UserType>[
  _$PROTECTORA,
  _$PROFESIONAL,
  _$PARTICULAR,
]);

Serializer<UserType> _$userTypeSerializer = new _$UserTypeSerializer();

class _$UserTypeSerializer implements PrimitiveSerializer<UserType> {
  @override
  final Iterable<Type> types = const <Type>[UserType];
  @override
  final String wireName = 'UserType';

  @override
  Object serialize(Serializers serializers, UserType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  UserType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      UserType.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
