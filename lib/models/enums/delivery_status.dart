import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jumpets_app/models/serializers/serializers.dart';

part 'delivery_status.g.dart';

class DeliveryStatus extends EnumClass {
  static const DeliveryStatus VACCINATED = _$VACCINATED;
  static const DeliveryStatus DEWORMED = _$DEWORMED;
  static const DeliveryStatus HEALTHY = _$HEALTHY;
  static const DeliveryStatus STERILIZED = _$STERILIZED;
  static const DeliveryStatus IDENTIFIED = _$IDENTIFIED;
  static const DeliveryStatus MICROCHIP = _$MICROCHIP;

  const DeliveryStatus._(String name) : super(name);

  static BuiltSet<DeliveryStatus> get values => _$deliveryStatusValues;
  static DeliveryStatus valueOf(String name) => _$deliveryStatusValueOf(name);

  String serialize() {
    return serializers.serializeWith(DeliveryStatus.serializer, this);
  }

  static DeliveryStatus deserialize(String string) {
    return serializers.deserializeWith(DeliveryStatus.serializer, string);
  }

  static Serializer<DeliveryStatus> get serializer =>
      _$deliveryStatusSerializer;
}
