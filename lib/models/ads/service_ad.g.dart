// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_ad.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ServiceAd> _$serviceAdSerializer = new _$ServiceAdSerializer();

class _$ServiceAdSerializer implements StructuredSerializer<ServiceAd> {
  @override
  final Iterable<Type> types = const [ServiceAd, _$ServiceAd];
  @override
  final String wireName = 'ServiceAd';

  @override
  Iterable<Object> serialize(Serializers serializers, ServiceAd object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'date',
      serializers.serialize(object.date,
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
      'priceHour',
      serializers.serialize(object.priceHour,
          specifiedType: const FullType(double)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ServiceAd deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ServiceAdBuilder();

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
        case 'date':
          result.date = serializers.deserialize(value,
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
        case 'priceHour':
          result.priceHour = serializers.deserialize(value,
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

class _$ServiceAd extends ServiceAd {
  @override
  final String id;
  @override
  final DateTime date;
  @override
  final BuiltList<String> tags;
  @override
  final BuiltList<String> photos;
  @override
  final User creator;
  @override
  final String title;
  @override
  final double priceHour;
  @override
  final String description;

  factory _$ServiceAd([void Function(ServiceAdBuilder) updates]) =>
      (new ServiceAdBuilder()..update(updates)).build();

  _$ServiceAd._(
      {this.id,
      this.date,
      this.tags,
      this.photos,
      this.creator,
      this.title,
      this.priceHour,
      this.description})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('ServiceAd', 'id');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('ServiceAd', 'date');
    }
    if (tags == null) {
      throw new BuiltValueNullFieldError('ServiceAd', 'tags');
    }
    if (photos == null) {
      throw new BuiltValueNullFieldError('ServiceAd', 'photos');
    }
    if (creator == null) {
      throw new BuiltValueNullFieldError('ServiceAd', 'creator');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('ServiceAd', 'title');
    }
    if (priceHour == null) {
      throw new BuiltValueNullFieldError('ServiceAd', 'priceHour');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('ServiceAd', 'description');
    }
  }

  @override
  ServiceAd rebuild(void Function(ServiceAdBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ServiceAdBuilder toBuilder() => new ServiceAdBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceAd &&
        id == other.id &&
        date == other.date &&
        tags == other.tags &&
        photos == other.photos &&
        creator == other.creator &&
        title == other.title &&
        priceHour == other.priceHour &&
        description == other.description;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, id.hashCode), date.hashCode),
                            tags.hashCode),
                        photos.hashCode),
                    creator.hashCode),
                title.hashCode),
            priceHour.hashCode),
        description.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ServiceAd')
          ..add('id', id)
          ..add('date', date)
          ..add('tags', tags)
          ..add('photos', photos)
          ..add('creator', creator)
          ..add('title', title)
          ..add('priceHour', priceHour)
          ..add('description', description))
        .toString();
  }
}

class ServiceAdBuilder implements Builder<ServiceAd, ServiceAdBuilder> {
  _$ServiceAd _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  DateTime _date;
  DateTime get date => _$this._date;
  set date(DateTime date) => _$this._date = date;

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

  double _priceHour;
  double get priceHour => _$this._priceHour;
  set priceHour(double priceHour) => _$this._priceHour = priceHour;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  ServiceAdBuilder();

  ServiceAdBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _date = _$v.date;
      _tags = _$v.tags?.toBuilder();
      _photos = _$v.photos?.toBuilder();
      _creator = _$v.creator;
      _title = _$v.title;
      _priceHour = _$v.priceHour;
      _description = _$v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ServiceAd other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ServiceAd;
  }

  @override
  void update(void Function(ServiceAdBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ServiceAd build() {
    _$ServiceAd _$result;
    try {
      _$result = _$v ??
          new _$ServiceAd._(
              id: id,
              date: date,
              tags: tags.build(),
              photos: photos.build(),
              creator: creator,
              title: title,
              priceHour: priceHour,
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
            'ServiceAd', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
