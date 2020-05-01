import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jumpets_app/models/serializers/serializers.dart';

part 'activity_level.g.dart';

class ActivityLevel extends EnumClass {
  static const ActivityLevel HIGH = _$HIGH;
  static const ActivityLevel MEDIUM = _$MEDIUM;
  static const ActivityLevel LOW = _$LOW;

  const ActivityLevel._(String name) : super(name);

  static BuiltSet<ActivityLevel> get values => _$activityLevelValues;
  static ActivityLevel valueOf(String name) => _$activityLevelValueOf(name);

  String serialize() {
    return serializers.serializeWith(ActivityLevel.serializer, this);
  }

  static ActivityLevel deserialize(String string) {
    return serializers.deserializeWith(ActivityLevel.serializer, string);
  }

  static Serializer<ActivityLevel> get serializer => _$activityLevelSerializer;
}
