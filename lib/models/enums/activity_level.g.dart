// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_level.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ActivityLevel _$HIGH = const ActivityLevel._('HIGH');
const ActivityLevel _$MEDIUM = const ActivityLevel._('MEDIUM');
const ActivityLevel _$LOW = const ActivityLevel._('LOW');

ActivityLevel _$activityLevelValueOf(String name) {
  switch (name) {
    case 'HIGH':
      return _$HIGH;
    case 'MEDIUM':
      return _$MEDIUM;
    case 'LOW':
      return _$LOW;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ActivityLevel> _$activityLevelValues =
    new BuiltSet<ActivityLevel>(const <ActivityLevel>[
  _$HIGH,
  _$MEDIUM,
  _$LOW,
]);

Serializer<ActivityLevel> _$activityLevelSerializer =
    new _$ActivityLevelSerializer();

class _$ActivityLevelSerializer implements PrimitiveSerializer<ActivityLevel> {
  @override
  final Iterable<Type> types = const <Type>[ActivityLevel];
  @override
  final String wireName = 'ActivityLevel';

  @override
  Object serialize(Serializers serializers, ActivityLevel object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  ActivityLevel deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ActivityLevel.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
