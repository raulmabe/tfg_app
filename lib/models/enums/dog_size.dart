import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jumpets_app/models/serializers/serializers.dart';

part 'dog_size.g.dart';

class DogSize extends EnumClass {
  static const DogSize BIG = _$BIG;
  static const DogSize MEDIUM = _$MEDIUM;
  static const DogSize SMALL = _$SMALL;

  const DogSize._(String name) : super(name);

  static BuiltSet<DogSize> get values => _$dogSizeValues;
  static DogSize valueOf(String name) => _$dogSizeValueOf(name);

  String serialize() {
    return serializers.serializeWith(DogSize.serializer, this);
  }

  static DogSize deserialize(String string) {
    return serializers.deserializeWith(DogSize.serializer, string);
  }

  static Serializer<DogSize> get serializer => _$dogSizeSerializer;
}
