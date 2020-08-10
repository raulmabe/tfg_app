// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PageInfo> _$pageInfoSerializer = new _$PageInfoSerializer();

class _$PageInfoSerializer implements StructuredSerializer<PageInfo> {
  @override
  final Iterable<Type> types = const [PageInfo, _$PageInfo];
  @override
  final String wireName = 'PageInfo';

  @override
  Iterable<Object> serialize(Serializers serializers, PageInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'hasNextPage',
      serializers.serialize(object.hasNextPage,
          specifiedType: const FullType(bool)),
      'hasPreviousPage',
      serializers.serialize(object.hasPreviousPage,
          specifiedType: const FullType(bool)),
    ];
    if (object.endCursor != null) {
      result
        ..add('endCursor')
        ..add(serializers.serialize(object.endCursor,
            specifiedType: const FullType(String)));
    }
    if (object.startCursor != null) {
      result
        ..add('startCursor')
        ..add(serializers.serialize(object.startCursor,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PageInfo deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PageInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'endCursor':
          result.endCursor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'startCursor':
          result.startCursor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'hasNextPage':
          result.hasNextPage = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'hasPreviousPage':
          result.hasPreviousPage = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$PageInfo extends PageInfo {
  @override
  final String endCursor;
  @override
  final String startCursor;
  @override
  final bool hasNextPage;
  @override
  final bool hasPreviousPage;

  factory _$PageInfo([void Function(PageInfoBuilder) updates]) =>
      (new PageInfoBuilder()..update(updates)).build();

  _$PageInfo._(
      {this.endCursor,
      this.startCursor,
      this.hasNextPage,
      this.hasPreviousPage})
      : super._() {
    if (hasNextPage == null) {
      throw new BuiltValueNullFieldError('PageInfo', 'hasNextPage');
    }
    if (hasPreviousPage == null) {
      throw new BuiltValueNullFieldError('PageInfo', 'hasPreviousPage');
    }
  }

  @override
  PageInfo rebuild(void Function(PageInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PageInfoBuilder toBuilder() => new PageInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PageInfo &&
        endCursor == other.endCursor &&
        startCursor == other.startCursor &&
        hasNextPage == other.hasNextPage &&
        hasPreviousPage == other.hasPreviousPage;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, endCursor.hashCode), startCursor.hashCode),
            hasNextPage.hashCode),
        hasPreviousPage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PageInfo')
          ..add('endCursor', endCursor)
          ..add('startCursor', startCursor)
          ..add('hasNextPage', hasNextPage)
          ..add('hasPreviousPage', hasPreviousPage))
        .toString();
  }
}

class PageInfoBuilder implements Builder<PageInfo, PageInfoBuilder> {
  _$PageInfo _$v;

  String _endCursor;
  String get endCursor => _$this._endCursor;
  set endCursor(String endCursor) => _$this._endCursor = endCursor;

  String _startCursor;
  String get startCursor => _$this._startCursor;
  set startCursor(String startCursor) => _$this._startCursor = startCursor;

  bool _hasNextPage;
  bool get hasNextPage => _$this._hasNextPage;
  set hasNextPage(bool hasNextPage) => _$this._hasNextPage = hasNextPage;

  bool _hasPreviousPage;
  bool get hasPreviousPage => _$this._hasPreviousPage;
  set hasPreviousPage(bool hasPreviousPage) =>
      _$this._hasPreviousPage = hasPreviousPage;

  PageInfoBuilder();

  PageInfoBuilder get _$this {
    if (_$v != null) {
      _endCursor = _$v.endCursor;
      _startCursor = _$v.startCursor;
      _hasNextPage = _$v.hasNextPage;
      _hasPreviousPage = _$v.hasPreviousPage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PageInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PageInfo;
  }

  @override
  void update(void Function(PageInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PageInfo build() {
    final _$result = _$v ??
        new _$PageInfo._(
            endCursor: endCursor,
            startCursor: startCursor,
            hasNextPage: hasNextPage,
            hasPreviousPage: hasPreviousPage);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
