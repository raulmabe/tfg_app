import 'package:built_value/serializer.dart';
import 'package:jumpets_app/models/ads/animals/bird_ad.dart';
import 'package:jumpets_app/models/ads/animals/cat_ad.dart';
import 'package:jumpets_app/models/ads/animals/dog_ad.dart';
import 'package:jumpets_app/models/ads/animals/fish_ad.dart';
import 'package:jumpets_app/models/ads/animals/other_ad.dart';
import 'package:jumpets_app/models/ads/animals/bunny_ad.dart';
import 'package:jumpets_app/models/ads/animals/reptile_ad.dart';
import 'package:jumpets_app/models/ads/animals/rodent_ad.dart';
import 'package:jumpets_app/models/ads/product_ad.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/models/ads/ad.dart';
import 'package:jumpets_app/models/ads/service_ad.dart';
import 'package:jumpets_app/models/enums/activity_level.dart';
import 'package:jumpets_app/models/enums/categories.dart';
import 'package:jumpets_app/models/enums/delivery_status.dart';
import 'package:jumpets_app/models/enums/dog_size.dart';
import 'package:jumpets_app/models/serializers/date_time_serializer_plugin.dart';
import 'package:jumpets_app/models/serializers/user_serializer.dart';
import 'package:jumpets_app/models/state/ads_state.dart';
import 'package:jumpets_app/models/state/app_state.dart';
import 'package:jumpets_app/models/state/auth/auth_state.dart';
import 'package:jumpets_app/models/state/auth/fav_ads_state.dart';
import 'package:jumpets_app/models/users/particular.dart';
import 'package:jumpets_app/models/users/profesional.dart';
import 'package:jumpets_app/models/users/protectora.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  AuthState,
  FavAdsState,
  AdsState,
  AppState,
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
