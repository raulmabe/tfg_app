import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jumpets_app/models/serializers/serializers.dart';

part 'animal_types.g.dart';

class AnimalType extends EnumClass {
  static const AnimalType DOG = _$DOG;
  static const AnimalType CAT = _$CAT;
  static const AnimalType BUNNY = _$BUNNY;
  static const AnimalType REPTILE = _$REPTILE;
  static const AnimalType OTHER = _$OTHER;
  static const AnimalType BIRD = _$BIRD;
  static const AnimalType RODENT = _$RODENT;
  static const AnimalType FISH = _$FISH;

  const AnimalType._(String name) : super(name);

  static BuiltSet<AnimalType> get values => _$animalTypeValues;
  static AnimalType valueOf(String name) => _$animalTypeValueOf(name);

  String serialize() {
    return serializers.serializeWith(AnimalType.serializer, this);
  }

  static AnimalType deserialize(String string) {
    return serializers.deserializeWith(AnimalType.serializer, string);
  }

  static Serializer<AnimalType> get serializer => _$animalTypeSerializer;
}
