import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jumpets_app/models/serializers/serializers.dart';

part 'info_card_view_model.g.dart';

abstract class InfoCardViewModel
    implements Built<InfoCardViewModel, InfoCardViewModelBuilder> {
  String get title;
  String get msg;

  @nullable
  String get url;

  InfoCardViewModel._();

  factory InfoCardViewModel([updates(InfoCardViewModelBuilder b)]) =
      _$InfoCardViewModel;

  String toJson() {
    return json
        .encode(serializers.serializeWith(InfoCardViewModel.serializer, this));
  }

  static InfoCardViewModel fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(InfoCardViewModel.serializer, json);
  }

  static Serializer<InfoCardViewModel> get serializer =>
      _$infoCardViewModelSerializer;
}
