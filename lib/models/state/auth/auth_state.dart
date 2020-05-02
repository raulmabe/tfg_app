import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jumpets_app/models/state/auth/fav_ads_state.dart';
import 'package:jumpets_app/models/users/user.dart';
import 'package:jumpets_app/models/serializers/serializers.dart';

part 'auth_state.g.dart';

abstract class AuthState implements Built<AuthState, AuthStateBuilder> {
  FavAdsState get favAdsState;

  @nullable
  String get email;

  @nullable
  String get password;

  @nullable
  User get userLogged;

  factory AuthState.initial() {
    return _$AuthState._(
      favAdsState: FavAdsState.initial(),
    );
  }

  AuthState._();
  factory AuthState([void Function(AuthStateBuilder) updates]) = _$AuthState;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AuthState.serializer, this);
  }

  static AuthState fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AuthState.serializer, json);
  }

  static Serializer<AuthState> get serializer => _$authStateSerializer;
}
