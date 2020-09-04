import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:jumpets_app/models/serializers/serializers.dart';
import 'package:jumpets_app/models/users/user.dart';

import '../models.dart';

part 'message.g.dart';

abstract class Message implements Built<Message, MessageBuilder> {
  String get id;

  String get text;

  @nullable
  Ad get ad;

  User get sender;
  DateTime get createdAt;
  DateTime get updatedAt;

  Message._();

  factory Message([updates(MessageBuilder b)]) = _$Message;

  String toJson() {
    return json.encode(serializers.serializeWith(Message.serializer, this));
  }

  static Message fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Message.serializer, json);
  }

  static Serializer<Message> get serializer => _$messageSerializer;
}
