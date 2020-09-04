import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:jumpets_app/models/chats/message.dart';
import 'package:jumpets_app/models/serializers/serializers.dart';
import 'package:jumpets_app/models/users/user.dart';

import '../models.dart';

part 'room.g.dart';

abstract class Room implements Built<Room, RoomBuilder> {
  String get id;

  User get user1;
  User get user2;

  BuiltList<Message> get messages;

  DateTime get createdAt;
  DateTime get updatedAt;

  Room._();

  factory Room([updates(RoomBuilder b)]) = _$Room;

  String toJson() {
    return json.encode(serializers.serializeWith(Room.serializer, this));
  }

  static Room fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Room.serializer, json);
  }

  static Serializer<Room> get serializer => _$roomSerializer;
}
