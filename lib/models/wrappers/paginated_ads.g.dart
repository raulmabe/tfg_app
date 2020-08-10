// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_ads.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PaginatedAds> _$paginatedAdsSerializer =
    new _$PaginatedAdsSerializer();

class _$PaginatedAdsSerializer implements StructuredSerializer<PaginatedAds> {
  @override
  final Iterable<Type> types = const [PaginatedAds, _$PaginatedAds];
  @override
  final String wireName = 'PaginatedAds';

  @override
  Iterable<Object> serialize(Serializers serializers, PaginatedAds object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'ads',
      serializers.serialize(object.ads,
          specifiedType: const FullType(BuiltList, const [const FullType(Ad)])),
      'pageInfo',
      serializers.serialize(object.pageInfo,
          specifiedType: const FullType(PageInfo)),
    ];

    return result;
  }

  @override
  PaginatedAds deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PaginatedAdsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'ads':
          result.ads.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Ad)]))
              as BuiltList<Object>);
          break;
        case 'pageInfo':
          result.pageInfo.replace(serializers.deserialize(value,
              specifiedType: const FullType(PageInfo)) as PageInfo);
          break;
      }
    }

    return result.build();
  }
}

class _$PaginatedAds extends PaginatedAds {
  @override
  final BuiltList<Ad> ads;
  @override
  final PageInfo pageInfo;

  factory _$PaginatedAds([void Function(PaginatedAdsBuilder) updates]) =>
      (new PaginatedAdsBuilder()..update(updates)).build();

  _$PaginatedAds._({this.ads, this.pageInfo}) : super._() {
    if (ads == null) {
      throw new BuiltValueNullFieldError('PaginatedAds', 'ads');
    }
    if (pageInfo == null) {
      throw new BuiltValueNullFieldError('PaginatedAds', 'pageInfo');
    }
  }

  @override
  PaginatedAds rebuild(void Function(PaginatedAdsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginatedAdsBuilder toBuilder() => new PaginatedAdsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginatedAds &&
        ads == other.ads &&
        pageInfo == other.pageInfo;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, ads.hashCode), pageInfo.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PaginatedAds')
          ..add('ads', ads)
          ..add('pageInfo', pageInfo))
        .toString();
  }
}

class PaginatedAdsBuilder
    implements Builder<PaginatedAds, PaginatedAdsBuilder> {
  _$PaginatedAds _$v;

  ListBuilder<Ad> _ads;
  ListBuilder<Ad> get ads => _$this._ads ??= new ListBuilder<Ad>();
  set ads(ListBuilder<Ad> ads) => _$this._ads = ads;

  PageInfoBuilder _pageInfo;
  PageInfoBuilder get pageInfo => _$this._pageInfo ??= new PageInfoBuilder();
  set pageInfo(PageInfoBuilder pageInfo) => _$this._pageInfo = pageInfo;

  PaginatedAdsBuilder();

  PaginatedAdsBuilder get _$this {
    if (_$v != null) {
      _ads = _$v.ads?.toBuilder();
      _pageInfo = _$v.pageInfo?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginatedAds other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PaginatedAds;
  }

  @override
  void update(void Function(PaginatedAdsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PaginatedAds build() {
    _$PaginatedAds _$result;
    try {
      _$result = _$v ??
          new _$PaginatedAds._(ads: ads.build(), pageInfo: pageInfo.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'ads';
        ads.build();
        _$failedField = 'pageInfo';
        pageInfo.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PaginatedAds', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
