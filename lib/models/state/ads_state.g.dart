// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AdsState> _$adsStateSerializer = new _$AdsStateSerializer();

class _$AdsStateSerializer implements StructuredSerializer<AdsState> {
  @override
  final Iterable<Type> types = const [AdsState, _$AdsState];
  @override
  final String wireName = 'AdsState';

  @override
  Iterable<Object> serialize(Serializers serializers, AdsState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'animalAds',
      serializers.serialize(object.animalAds,
          specifiedType:
              const FullType(BuiltList, const [const FullType(AnimalAd)])),
      'serviceAds',
      serializers.serialize(object.serviceAds,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ServiceAd)])),
      'productAds',
      serializers.serialize(object.productAds,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ProductAd)])),
      'protectoraAds',
      serializers.serialize(object.protectoraAds,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Protectora)])),
      'selectedCategory',
      serializers.serialize(object.selectedCategory,
          specifiedType: const FullType(Category)),
    ];

    return result;
  }

  @override
  AdsState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AdsStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'animalAds':
          result.animalAds.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AnimalAd)]))
              as BuiltList<Object>);
          break;
        case 'serviceAds':
          result.serviceAds.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ServiceAd)]))
              as BuiltList<Object>);
          break;
        case 'productAds':
          result.productAds.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ProductAd)]))
              as BuiltList<Object>);
          break;
        case 'protectoraAds':
          result.protectoraAds.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Protectora)]))
              as BuiltList<Object>);
          break;
        case 'selectedCategory':
          result.selectedCategory = serializers.deserialize(value,
              specifiedType: const FullType(Category)) as Category;
          break;
      }
    }

    return result.build();
  }
}

class _$AdsState extends AdsState {
  @override
  final BuiltList<AnimalAd> animalAds;
  @override
  final BuiltList<ServiceAd> serviceAds;
  @override
  final BuiltList<ProductAd> productAds;
  @override
  final BuiltList<Protectora> protectoraAds;
  @override
  final Category selectedCategory;

  factory _$AdsState([void Function(AdsStateBuilder) updates]) =>
      (new AdsStateBuilder()..update(updates)).build();

  _$AdsState._(
      {this.animalAds,
      this.serviceAds,
      this.productAds,
      this.protectoraAds,
      this.selectedCategory})
      : super._() {
    if (animalAds == null) {
      throw new BuiltValueNullFieldError('AdsState', 'animalAds');
    }
    if (serviceAds == null) {
      throw new BuiltValueNullFieldError('AdsState', 'serviceAds');
    }
    if (productAds == null) {
      throw new BuiltValueNullFieldError('AdsState', 'productAds');
    }
    if (protectoraAds == null) {
      throw new BuiltValueNullFieldError('AdsState', 'protectoraAds');
    }
    if (selectedCategory == null) {
      throw new BuiltValueNullFieldError('AdsState', 'selectedCategory');
    }
  }

  @override
  AdsState rebuild(void Function(AdsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdsStateBuilder toBuilder() => new AdsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdsState &&
        animalAds == other.animalAds &&
        serviceAds == other.serviceAds &&
        productAds == other.productAds &&
        protectoraAds == other.protectoraAds &&
        selectedCategory == other.selectedCategory;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, animalAds.hashCode), serviceAds.hashCode),
                productAds.hashCode),
            protectoraAds.hashCode),
        selectedCategory.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AdsState')
          ..add('animalAds', animalAds)
          ..add('serviceAds', serviceAds)
          ..add('productAds', productAds)
          ..add('protectoraAds', protectoraAds)
          ..add('selectedCategory', selectedCategory))
        .toString();
  }
}

class AdsStateBuilder implements Builder<AdsState, AdsStateBuilder> {
  _$AdsState _$v;

  ListBuilder<AnimalAd> _animalAds;
  ListBuilder<AnimalAd> get animalAds =>
      _$this._animalAds ??= new ListBuilder<AnimalAd>();
  set animalAds(ListBuilder<AnimalAd> animalAds) =>
      _$this._animalAds = animalAds;

  ListBuilder<ServiceAd> _serviceAds;
  ListBuilder<ServiceAd> get serviceAds =>
      _$this._serviceAds ??= new ListBuilder<ServiceAd>();
  set serviceAds(ListBuilder<ServiceAd> serviceAds) =>
      _$this._serviceAds = serviceAds;

  ListBuilder<ProductAd> _productAds;
  ListBuilder<ProductAd> get productAds =>
      _$this._productAds ??= new ListBuilder<ProductAd>();
  set productAds(ListBuilder<ProductAd> productAds) =>
      _$this._productAds = productAds;

  ListBuilder<Protectora> _protectoraAds;
  ListBuilder<Protectora> get protectoraAds =>
      _$this._protectoraAds ??= new ListBuilder<Protectora>();
  set protectoraAds(ListBuilder<Protectora> protectoraAds) =>
      _$this._protectoraAds = protectoraAds;

  Category _selectedCategory;
  Category get selectedCategory => _$this._selectedCategory;
  set selectedCategory(Category selectedCategory) =>
      _$this._selectedCategory = selectedCategory;

  AdsStateBuilder();

  AdsStateBuilder get _$this {
    if (_$v != null) {
      _animalAds = _$v.animalAds?.toBuilder();
      _serviceAds = _$v.serviceAds?.toBuilder();
      _productAds = _$v.productAds?.toBuilder();
      _protectoraAds = _$v.protectoraAds?.toBuilder();
      _selectedCategory = _$v.selectedCategory;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdsState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AdsState;
  }

  @override
  void update(void Function(AdsStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AdsState build() {
    _$AdsState _$result;
    try {
      _$result = _$v ??
          new _$AdsState._(
              animalAds: animalAds.build(),
              serviceAds: serviceAds.build(),
              productAds: productAds.build(),
              protectoraAds: protectoraAds.build(),
              selectedCategory: selectedCategory);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'animalAds';
        animalAds.build();
        _$failedField = 'serviceAds';
        serviceAds.build();
        _$failedField = 'productAds';
        productAds.build();
        _$failedField = 'protectoraAds';
        protectoraAds.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AdsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
