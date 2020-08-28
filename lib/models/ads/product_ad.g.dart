// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_ad.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductAd> _$productAdSerializer = new _$ProductAdSerializer();

class _$ProductAdSerializer implements StructuredSerializer<ProductAd> {
  @override
  final Iterable<Type> types = const [ProductAd, _$ProductAd];
  @override
  final String wireName = 'ProductAd';

  @override
  Iterable<Object> serialize(Serializers serializers, ProductAd object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(DateTime)),
      'tags',
      serializers.serialize(object.tags,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'photos',
      serializers.serialize(object.photos,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'creator',
      serializers.serialize(object.creator,
          specifiedType: const FullType(User)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'price',
      serializers.serialize(object.price,
          specifiedType: const FullType(double)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ProductAd deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductAdBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'photos':
          result.photos.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'creator':
          result.creator = serializers.deserialize(value,
              specifiedType: const FullType(User)) as User;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ProductAd extends ProductAd {
  @override
  final String id;
  @override
  final DateTime createdAt;
  @override
  final BuiltList<String> tags;
  @override
  final BuiltList<String> photos;
  @override
  final User creator;
  @override
  final String title;
  @override
  final double price;
  @override
  final String description;

  factory _$ProductAd([void Function(ProductAdBuilder) updates]) =>
      (new ProductAdBuilder()..update(updates)).build();

  _$ProductAd._(
      {this.id,
      this.createdAt,
      this.tags,
      this.photos,
      this.creator,
      this.title,
      this.price,
      this.description})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('ProductAd', 'id');
    }
    if (createdAt == null) {
      throw new BuiltValueNullFieldError('ProductAd', 'createdAt');
    }
    if (tags == null) {
      throw new BuiltValueNullFieldError('ProductAd', 'tags');
    }
    if (photos == null) {
      throw new BuiltValueNullFieldError('ProductAd', 'photos');
    }
    if (creator == null) {
      throw new BuiltValueNullFieldError('ProductAd', 'creator');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('ProductAd', 'title');
    }
    if (price == null) {
      throw new BuiltValueNullFieldError('ProductAd', 'price');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('ProductAd', 'description');
    }
  }

  @override
  ProductAd rebuild(void Function(ProductAdBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductAdBuilder toBuilder() => new ProductAdBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductAd &&
        id == other.id &&
        createdAt == other.createdAt &&
        tags == other.tags &&
        photos == other.photos &&
        creator == other.creator &&
        title == other.title &&
        price == other.price &&
        description == other.description;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, id.hashCode), createdAt.hashCode),
                            tags.hashCode),
                        photos.hashCode),
                    creator.hashCode),
                title.hashCode),
            price.hashCode),
        description.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProductAd')
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('tags', tags)
          ..add('photos', photos)
          ..add('creator', creator)
          ..add('title', title)
          ..add('price', price)
          ..add('description', description))
        .toString();
  }
}

class ProductAdBuilder
    implements Builder<ProductAd, ProductAdBuilder>, AdBuilder {
  _$ProductAd _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  DateTime _createdAt;
  DateTime get createdAt => _$this._createdAt;
  set createdAt(DateTime createdAt) => _$this._createdAt = createdAt;

  ListBuilder<String> _tags;
  ListBuilder<String> get tags => _$this._tags ??= new ListBuilder<String>();
  set tags(ListBuilder<String> tags) => _$this._tags = tags;

  ListBuilder<String> _photos;
  ListBuilder<String> get photos =>
      _$this._photos ??= new ListBuilder<String>();
  set photos(ListBuilder<String> photos) => _$this._photos = photos;

  User _creator;
  User get creator => _$this._creator;
  set creator(User creator) => _$this._creator = creator;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  double _price;
  double get price => _$this._price;
  set price(double price) => _$this._price = price;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  ProductAdBuilder();

  ProductAdBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _createdAt = _$v.createdAt;
      _tags = _$v.tags?.toBuilder();
      _photos = _$v.photos?.toBuilder();
      _creator = _$v.creator;
      _title = _$v.title;
      _price = _$v.price;
      _description = _$v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ProductAd other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProductAd;
  }

  @override
  void update(void Function(ProductAdBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProductAd build() {
    _$ProductAd _$result;
    try {
      _$result = _$v ??
          new _$ProductAd._(
              id: id,
              createdAt: createdAt,
              tags: tags.build(),
              photos: photos.build(),
              creator: creator,
              title: title,
              price: price,
              description: description);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'tags';
        tags.build();
        _$failedField = 'photos';
        photos.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ProductAd', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
