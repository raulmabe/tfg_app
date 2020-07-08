// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav_ads_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FavAdsState> _$favAdsStateSerializer = new _$FavAdsStateSerializer();

class _$FavAdsStateSerializer implements StructuredSerializer<FavAdsState> {
  @override
  final Iterable<Type> types = const [FavAdsState, _$FavAdsState];
  @override
  final String wireName = 'FavAdsState';

  @override
  Iterable<Object> serialize(Serializers serializers, FavAdsState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.favAds != null) {
      result
        ..add('favAds')
        ..add(serializers.serialize(object.favAds,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Ad)])));
    }
    if (object.isLoading != null) {
      result
        ..add('isLoading')
        ..add(serializers.serialize(object.isLoading,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  FavAdsState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FavAdsStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'favAds':
          result.favAds.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Ad)]))
              as BuiltList<Object>);
          break;
        case 'isLoading':
          result.isLoading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$FavAdsState extends FavAdsState {
  @override
  final BuiltList<Ad> favAds;
  @override
  final bool isLoading;

  factory _$FavAdsState([void Function(FavAdsStateBuilder) updates]) =>
      (new FavAdsStateBuilder()..update(updates)).build();

  _$FavAdsState._({this.favAds, this.isLoading}) : super._();

  @override
  FavAdsState rebuild(void Function(FavAdsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FavAdsStateBuilder toBuilder() => new FavAdsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FavAdsState &&
        favAds == other.favAds &&
        isLoading == other.isLoading;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, favAds.hashCode), isLoading.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FavAdsState')
          ..add('favAds', favAds)
          ..add('isLoading', isLoading))
        .toString();
  }
}

class FavAdsStateBuilder implements Builder<FavAdsState, FavAdsStateBuilder> {
  _$FavAdsState _$v;

  ListBuilder<Ad> _favAds;
  ListBuilder<Ad> get favAds => _$this._favAds ??= new ListBuilder<Ad>();
  set favAds(ListBuilder<Ad> favAds) => _$this._favAds = favAds;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  FavAdsStateBuilder();

  FavAdsStateBuilder get _$this {
    if (_$v != null) {
      _favAds = _$v.favAds?.toBuilder();
      _isLoading = _$v.isLoading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FavAdsState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FavAdsState;
  }

  @override
  void update(void Function(FavAdsStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FavAdsState build() {
    _$FavAdsState _$result;
    try {
      _$result = _$v ??
          new _$FavAdsState._(favAds: _favAds?.build(), isLoading: isLoading);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'favAds';
        _favAds?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FavAdsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
