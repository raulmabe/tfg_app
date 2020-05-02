// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthState> _$authStateSerializer = new _$AuthStateSerializer();

class _$AuthStateSerializer implements StructuredSerializer<AuthState> {
  @override
  final Iterable<Type> types = const [AuthState, _$AuthState];
  @override
  final String wireName = 'AuthState';

  @override
  Iterable<Object> serialize(Serializers serializers, AuthState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'favAdsState',
      serializers.serialize(object.favAdsState,
          specifiedType: const FullType(FavAdsState)),
    ];
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    if (object.password != null) {
      result
        ..add('password')
        ..add(serializers.serialize(object.password,
            specifiedType: const FullType(String)));
    }
    if (object.userLogged != null) {
      result
        ..add('userLogged')
        ..add(serializers.serialize(object.userLogged,
            specifiedType: const FullType(User)));
    }
    return result;
  }

  @override
  AuthState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'favAdsState':
          result.favAdsState.replace(serializers.deserialize(value,
              specifiedType: const FullType(FavAdsState)) as FavAdsState);
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userLogged':
          result.userLogged = serializers.deserialize(value,
              specifiedType: const FullType(User)) as User;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthState extends AuthState {
  @override
  final FavAdsState favAdsState;
  @override
  final String email;
  @override
  final String password;
  @override
  final User userLogged;

  factory _$AuthState([void Function(AuthStateBuilder) updates]) =>
      (new AuthStateBuilder()..update(updates)).build();

  _$AuthState._({this.favAdsState, this.email, this.password, this.userLogged})
      : super._() {
    if (favAdsState == null) {
      throw new BuiltValueNullFieldError('AuthState', 'favAdsState');
    }
  }

  @override
  AuthState rebuild(void Function(AuthStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthStateBuilder toBuilder() => new AuthStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthState &&
        favAdsState == other.favAdsState &&
        email == other.email &&
        password == other.password &&
        userLogged == other.userLogged;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, favAdsState.hashCode), email.hashCode),
            password.hashCode),
        userLogged.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthState')
          ..add('favAdsState', favAdsState)
          ..add('email', email)
          ..add('password', password)
          ..add('userLogged', userLogged))
        .toString();
  }
}

class AuthStateBuilder implements Builder<AuthState, AuthStateBuilder> {
  _$AuthState _$v;

  FavAdsStateBuilder _favAdsState;
  FavAdsStateBuilder get favAdsState =>
      _$this._favAdsState ??= new FavAdsStateBuilder();
  set favAdsState(FavAdsStateBuilder favAdsState) =>
      _$this._favAdsState = favAdsState;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  User _userLogged;
  User get userLogged => _$this._userLogged;
  set userLogged(User userLogged) => _$this._userLogged = userLogged;

  AuthStateBuilder();

  AuthStateBuilder get _$this {
    if (_$v != null) {
      _favAdsState = _$v.favAdsState?.toBuilder();
      _email = _$v.email;
      _password = _$v.password;
      _userLogged = _$v.userLogged;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AuthState;
  }

  @override
  void update(void Function(AuthStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthState build() {
    _$AuthState _$result;
    try {
      _$result = _$v ??
          new _$AuthState._(
              favAdsState: favAdsState.build(),
              email: email,
              password: password,
              userLogged: userLogged);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'favAdsState';
        favAdsState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AuthState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
