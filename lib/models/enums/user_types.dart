import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jumpets_app/models/serializers/serializers.dart';

part 'user_types.g.dart';

class UserType extends EnumClass {
  static const UserType PROTECTORA = _$PROTECTORA;
  static const UserType PROFESIONAL = _$PROFESIONAL;
  static const UserType PARTICULAR = _$PARTICULAR;

  const UserType._(String name) : super(name);

  static BuiltSet<UserType> get values => _$userTypeValues;
  static UserType valueOf(String name) => _$userTypeValueOf(name);

  String serialize() {
    return serializers.serializeWith(UserType.serializer, this);
  }

  static UserType deserialize(String string) {
    return serializers.deserializeWith(UserType.serializer, string);
  }

  static Serializer<UserType> get serializer => _$userTypeSerializer;
}
