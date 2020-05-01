import 'package:built_value/serializer.dart';

class DateTimeSerializerPlugin implements SerializerPlugin {
  @override
  Object beforeSerialize(Object object, FullType specifiedType) {
    /* return object; */
    if (specifiedType.root != DateTime) return object;
    return DateTime.parse(object.toString()).toUtc();
  }

  @override
  Object afterSerialize(Object object, FullType specifiedType) => object;

  @override
  Object beforeDeserialize(Object object, FullType specifiedType) {
    if (specifiedType.root != DateTime) return object;
    return DateTime.parse(object as String).toUtc().microsecondsSinceEpoch;
  }

  @override
  Object afterDeserialize(Object object, FullType specifiedType) => object;
}
