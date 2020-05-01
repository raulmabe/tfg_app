// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DeliveryStatus _$VACCINATED = const DeliveryStatus._('VACCINATED');
const DeliveryStatus _$DEWORMED = const DeliveryStatus._('DEWORMED');
const DeliveryStatus _$HEALTHY = const DeliveryStatus._('HEALTHY');
const DeliveryStatus _$STERILIZED = const DeliveryStatus._('STERILIZED');
const DeliveryStatus _$IDENTIFIED = const DeliveryStatus._('IDENTIFIED');
const DeliveryStatus _$MICROCHIP = const DeliveryStatus._('MICROCHIP');

DeliveryStatus _$deliveryStatusValueOf(String name) {
  switch (name) {
    case 'VACCINATED':
      return _$VACCINATED;
    case 'DEWORMED':
      return _$DEWORMED;
    case 'HEALTHY':
      return _$HEALTHY;
    case 'STERILIZED':
      return _$STERILIZED;
    case 'IDENTIFIED':
      return _$IDENTIFIED;
    case 'MICROCHIP':
      return _$MICROCHIP;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<DeliveryStatus> _$deliveryStatusValues =
    new BuiltSet<DeliveryStatus>(const <DeliveryStatus>[
  _$VACCINATED,
  _$DEWORMED,
  _$HEALTHY,
  _$STERILIZED,
  _$IDENTIFIED,
  _$MICROCHIP,
]);

Serializer<DeliveryStatus> _$deliveryStatusSerializer =
    new _$DeliveryStatusSerializer();

class _$DeliveryStatusSerializer
    implements PrimitiveSerializer<DeliveryStatus> {
  @override
  final Iterable<Type> types = const <Type>[DeliveryStatus];
  @override
  final String wireName = 'DeliveryStatus';

  @override
  Object serialize(Serializers serializers, DeliveryStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  DeliveryStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DeliveryStatus.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
