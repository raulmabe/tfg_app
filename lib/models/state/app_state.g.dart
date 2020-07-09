// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppState> _$appStateSerializer = new _$AppStateSerializer();

class _$AppStateSerializer implements StructuredSerializer<AppState> {
  @override
  final Iterable<Type> types = const [AppState, _$AppState];
  @override
  final String wireName = 'AppState';

  @override
  Iterable<Object> serialize(Serializers serializers, AppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'adsState',
      serializers.serialize(object.adsState,
          specifiedType: const FullType(AdsState)),
      'authState',
      serializers.serialize(object.authState,
          specifiedType: const FullType(AuthState)),
      'errorsState',
      serializers.serialize(object.errorsState,
          specifiedType: const FullType(ErrorsState)),
    ];

    return result;
  }

  @override
  AppState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'adsState':
          result.adsState.replace(serializers.deserialize(value,
              specifiedType: const FullType(AdsState)) as AdsState);
          break;
        case 'authState':
          result.authState.replace(serializers.deserialize(value,
              specifiedType: const FullType(AuthState)) as AuthState);
          break;
        case 'errorsState':
          result.errorsState.replace(serializers.deserialize(value,
              specifiedType: const FullType(ErrorsState)) as ErrorsState);
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final AdsState adsState;
  @override
  final AuthState authState;
  @override
  final ErrorsState errorsState;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._({this.adsState, this.authState, this.errorsState}) : super._() {
    if (adsState == null) {
      throw new BuiltValueNullFieldError('AppState', 'adsState');
    }
    if (authState == null) {
      throw new BuiltValueNullFieldError('AppState', 'authState');
    }
    if (errorsState == null) {
      throw new BuiltValueNullFieldError('AppState', 'errorsState');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        adsState == other.adsState &&
        authState == other.authState &&
        errorsState == other.errorsState;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, adsState.hashCode), authState.hashCode),
        errorsState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('adsState', adsState)
          ..add('authState', authState)
          ..add('errorsState', errorsState))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  AdsStateBuilder _adsState;
  AdsStateBuilder get adsState => _$this._adsState ??= new AdsStateBuilder();
  set adsState(AdsStateBuilder adsState) => _$this._adsState = adsState;

  AuthStateBuilder _authState;
  AuthStateBuilder get authState =>
      _$this._authState ??= new AuthStateBuilder();
  set authState(AuthStateBuilder authState) => _$this._authState = authState;

  ErrorsStateBuilder _errorsState;
  ErrorsStateBuilder get errorsState =>
      _$this._errorsState ??= new ErrorsStateBuilder();
  set errorsState(ErrorsStateBuilder errorsState) =>
      _$this._errorsState = errorsState;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _adsState = _$v.adsState?.toBuilder();
      _authState = _$v.authState?.toBuilder();
      _errorsState = _$v.errorsState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              adsState: adsState.build(),
              authState: authState.build(),
              errorsState: errorsState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'adsState';
        adsState.build();
        _$failedField = 'authState';
        authState.build();
        _$failedField = 'errorsState';
        errorsState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
