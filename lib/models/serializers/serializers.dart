import 'package:built_value/serializer.dart';

import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';
import 'package:jumpets_app/models/chats/message.dart';
import 'package:jumpets_app/models/chats/room.dart';
import 'package:jumpets_app/models/wrappers/auth_data.dart';

import 'package:jumpets_app/models/models.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  User,
  Message,
  Room,
  Valuation,
  AuthData,
  DogAd,
  ReptileAd,
  BunnyAd,
  RodentAd,
  BirdAd,
  OtherAd,
  FishAd,
  CatAd,
  ProductAd,
  ServiceAd,
  ActivityLevel,
  DogSize,
  DeliveryStatus,
  Profesional,
  Particular,
  Protectora,
  Category
])
final Serializers serializers = (_$serializers.toBuilder()
      ..add(UserSerializer())
      ..addPlugin(new DateTimeSerializerPlugin())
      ..addPlugin(StandardJsonPlugin()))
    .build();
