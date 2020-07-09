import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/models/enums/categories.dart';
import 'package:jumpets_app/models/serializers/serializers.dart';
import 'package:jumpets_app/models/users/protectora.dart';

part 'errors_state.g.dart';

abstract class ErrorsState implements Built<ErrorsState, ErrorsStateBuilder> {
  @nullable
  String get error;

  BuiltList<Object> get pendingActions;

  factory ErrorsState.initial() {
    return _$ErrorsState._(
      pendingActions: BuiltList(<Object>[]),
    );
  }

  ErrorsState._();
  factory ErrorsState([void Function(ErrorsStateBuilder) updates]) =
      _$ErrorsState;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ErrorsState.serializer, this);
  }

  static ErrorsState fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ErrorsState.serializer, json);
  }

  static Serializer<ErrorsState> get serializer => _$errorsStateSerializer;
}
