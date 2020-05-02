// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_ad.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DogAd> _$dogAdSerializer = new _$DogAdSerializer();

class _$DogAdSerializer implements StructuredSerializer<DogAd> {
  @override
  final Iterable<Type> types = const [DogAd, _$DogAd];
  @override
  final String wireName = 'DogAd';

  @override
  Iterable<Object> serialize(Serializers serializers, DogAd object,
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
      'owner',
      serializers.serialize(object.owner, specifiedType: const FullType(User)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'activityLevel',
      serializers.serialize(object.activityLevel,
          specifiedType: const FullType(ActivityLevel)),
      'birthDate',
      serializers.serialize(object.birthDate,
          specifiedType: const FullType(DateTime)),
      'male',
      serializers.serialize(object.male, specifiedType: const FullType(bool)),
      'adoptionTax',
      serializers.serialize(object.adoptionTax,
          specifiedType: const FullType(double)),
      'weight',
      serializers.serialize(object.weight,
          specifiedType: const FullType(double)),
      'personality',
      serializers.serialize(object.personality,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'size',
      serializers.serialize(object.size,
          specifiedType: const FullType(DogSize)),
      'deliveryInfo',
      serializers.serialize(object.deliveryInfo,
          specifiedType: const FullType(
              BuiltList, const [const FullType(DeliveryStatus)])),
    ];
    if (object.mustKnow != null) {
      result
        ..add('mustKnow')
        ..add(serializers.serialize(object.mustKnow,
            specifiedType: const FullType(String)));
    }
    if (object.deliveryStatuses != null) {
      result
        ..add('deliveryStatuses')
        ..add(serializers.serialize(object.deliveryStatuses,
            specifiedType: const FullType(
                BuiltList, const [const FullType(DeliveryStatus)])));
    }
    if (object.breed != null) {
      result
        ..add('breed')
        ..add(serializers.serialize(object.breed,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  DogAd deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DogAdBuilder();

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
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(User)) as User;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'activityLevel':
          result.activityLevel = serializers.deserialize(value,
              specifiedType: const FullType(ActivityLevel)) as ActivityLevel;
          break;
        case 'birthDate':
          result.birthDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'male':
          result.male = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'adoptionTax':
          result.adoptionTax = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'weight':
          result.weight = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'personality':
          result.personality.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'mustKnow':
          result.mustKnow = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'deliveryStatuses':
          result.deliveryStatuses.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DeliveryStatus)]))
              as BuiltList<Object>);
          break;
        case 'breed':
          result.breed = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'size':
          result.size = serializers.deserialize(value,
              specifiedType: const FullType(DogSize)) as DogSize;
          break;
        case 'deliveryInfo':
          result.deliveryInfo.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DeliveryStatus)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$DogAd extends DogAd {
  @override
  final String id;
  @override
  final DateTime date;
  @override
  final BuiltList<String> tags;
  @override
  final BuiltList<String> photos;
  @override
  final User owner;
  @override
  final String name;
  @override
  final String description;
  @override
  final ActivityLevel activityLevel;
  @override
  final DateTime birthDate;
  @override
  final bool male;
  @override
  final double adoptionTax;
  @override
  final double weight;
  @override
  final BuiltList<String> personality;
  @override
  final String mustKnow;
  @override
  final BuiltList<DeliveryStatus> deliveryStatuses;
  @override
  final String breed;
  @override
  final DogSize size;
  @override
  final BuiltList<DeliveryStatus> deliveryInfo;

  factory _$DogAd([void Function(DogAdBuilder) updates]) =>
      (new DogAdBuilder()..update(updates)).build();

  _$DogAd._(
      {this.id,
      this.date,
      this.tags,
      this.photos,
      this.owner,
      this.name,
      this.description,
      this.activityLevel,
      this.birthDate,
      this.male,
      this.adoptionTax,
      this.weight,
      this.personality,
      this.mustKnow,
      this.deliveryStatuses,
      this.breed,
      this.size,
      this.deliveryInfo})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('DogAd', 'id');
    }
    if (date == null) {
      throw new BuiltValueNullFieldError('DogAd', 'date');
    }
    if (tags == null) {
      throw new BuiltValueNullFieldError('DogAd', 'tags');
    }
    if (photos == null) {
      throw new BuiltValueNullFieldError('DogAd', 'photos');
    }
    if (owner == null) {
      throw new BuiltValueNullFieldError('DogAd', 'owner');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('DogAd', 'name');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('DogAd', 'description');
    }
    if (activityLevel == null) {
      throw new BuiltValueNullFieldError('DogAd', 'activityLevel');
    }
    if (birthDate == null) {
      throw new BuiltValueNullFieldError('DogAd', 'birthDate');
    }
    if (male == null) {
      throw new BuiltValueNullFieldError('DogAd', 'male');
    }
    if (adoptionTax == null) {
      throw new BuiltValueNullFieldError('DogAd', 'adoptionTax');
    }
    if (weight == null) {
      throw new BuiltValueNullFieldError('DogAd', 'weight');
    }
    if (personality == null) {
      throw new BuiltValueNullFieldError('DogAd', 'personality');
    }
    if (size == null) {
      throw new BuiltValueNullFieldError('DogAd', 'size');
    }
    if (deliveryInfo == null) {
      throw new BuiltValueNullFieldError('DogAd', 'deliveryInfo');
    }
  }

  @override
  DogAd rebuild(void Function(DogAdBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DogAdBuilder toBuilder() => new DogAdBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DogAd &&
        id == other.id &&
        date == other.date &&
        tags == other.tags &&
        photos == other.photos &&
        owner == other.owner &&
        name == other.name &&
        description == other.description &&
        activityLevel == other.activityLevel &&
        birthDate == other.birthDate &&
        male == other.male &&
        adoptionTax == other.adoptionTax &&
        weight == other.weight &&
        personality == other.personality &&
        mustKnow == other.mustKnow &&
        deliveryStatuses == other.deliveryStatuses &&
        breed == other.breed &&
        size == other.size &&
        deliveryInfo == other.deliveryInfo;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(0,
                                                                            id.hashCode),
                                                                        date.hashCode),
                                                                    tags.hashCode),
                                                                photos.hashCode),
                                                            owner.hashCode),
                                                        name.hashCode),
                                                    description.hashCode),
                                                activityLevel.hashCode),
                                            birthDate.hashCode),
                                        male.hashCode),
                                    adoptionTax.hashCode),
                                weight.hashCode),
                            personality.hashCode),
                        mustKnow.hashCode),
                    deliveryStatuses.hashCode),
                breed.hashCode),
            size.hashCode),
        deliveryInfo.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DogAd')
          ..add('id', id)
          ..add('date', date)
          ..add('tags', tags)
          ..add('photos', photos)
          ..add('owner', owner)
          ..add('name', name)
          ..add('description', description)
          ..add('activityLevel', activityLevel)
          ..add('birthDate', birthDate)
          ..add('male', male)
          ..add('adoptionTax', adoptionTax)
          ..add('weight', weight)
          ..add('personality', personality)
          ..add('mustKnow', mustKnow)
          ..add('deliveryStatuses', deliveryStatuses)
          ..add('breed', breed)
          ..add('size', size)
          ..add('deliveryInfo', deliveryInfo))
        .toString();
  }
}

class DogAdBuilder implements Builder<DogAd, DogAdBuilder> {
  _$DogAd _$v;

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

  User _owner;
  User get owner => _$this._owner;
  set owner(User owner) => _$this._owner = owner;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  ActivityLevel _activityLevel;
  ActivityLevel get activityLevel => _$this._activityLevel;
  set activityLevel(ActivityLevel activityLevel) =>
      _$this._activityLevel = activityLevel;

  DateTime _birthDate;
  DateTime get birthDate => _$this._birthDate;
  set birthDate(DateTime birthDate) => _$this._birthDate = birthDate;

  bool _male;
  bool get male => _$this._male;
  set male(bool male) => _$this._male = male;

  double _adoptionTax;
  double get adoptionTax => _$this._adoptionTax;
  set adoptionTax(double adoptionTax) => _$this._adoptionTax = adoptionTax;

  double _weight;
  double get weight => _$this._weight;
  set weight(double weight) => _$this._weight = weight;

  ListBuilder<String> _personality;
  ListBuilder<String> get personality =>
      _$this._personality ??= new ListBuilder<String>();
  set personality(ListBuilder<String> personality) =>
      _$this._personality = personality;

  String _mustKnow;
  String get mustKnow => _$this._mustKnow;
  set mustKnow(String mustKnow) => _$this._mustKnow = mustKnow;

  ListBuilder<DeliveryStatus> _deliveryStatuses;
  ListBuilder<DeliveryStatus> get deliveryStatuses =>
      _$this._deliveryStatuses ??= new ListBuilder<DeliveryStatus>();
  set deliveryStatuses(ListBuilder<DeliveryStatus> deliveryStatuses) =>
      _$this._deliveryStatuses = deliveryStatuses;

  String _breed;
  String get breed => _$this._breed;
  set breed(String breed) => _$this._breed = breed;

  DogSize _size;
  DogSize get size => _$this._size;
  set size(DogSize size) => _$this._size = size;

  ListBuilder<DeliveryStatus> _deliveryInfo;
  ListBuilder<DeliveryStatus> get deliveryInfo =>
      _$this._deliveryInfo ??= new ListBuilder<DeliveryStatus>();
  set deliveryInfo(ListBuilder<DeliveryStatus> deliveryInfo) =>
      _$this._deliveryInfo = deliveryInfo;

  DogAdBuilder();

  DogAdBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _date = _$v.date;
      _tags = _$v.tags?.toBuilder();
      _photos = _$v.photos?.toBuilder();
      _owner = _$v.owner;
      _name = _$v.name;
      _description = _$v.description;
      _activityLevel = _$v.activityLevel;
      _birthDate = _$v.birthDate;
      _male = _$v.male;
      _adoptionTax = _$v.adoptionTax;
      _weight = _$v.weight;
      _personality = _$v.personality?.toBuilder();
      _mustKnow = _$v.mustKnow;
      _deliveryStatuses = _$v.deliveryStatuses?.toBuilder();
      _breed = _$v.breed;
      _size = _$v.size;
      _deliveryInfo = _$v.deliveryInfo?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DogAd other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DogAd;
  }

  @override
  void update(void Function(DogAdBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DogAd build() {
    _$DogAd _$result;
    try {
      _$result = _$v ??
          new _$DogAd._(
              id: id,
              date: date,
              tags: tags.build(),
              photos: photos.build(),
              owner: owner,
              name: name,
              description: description,
              activityLevel: activityLevel,
              birthDate: birthDate,
              male: male,
              adoptionTax: adoptionTax,
              weight: weight,
              personality: personality.build(),
              mustKnow: mustKnow,
              deliveryStatuses: _deliveryStatuses?.build(),
              breed: breed,
              size: size,
              deliveryInfo: deliveryInfo.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'tags';
        tags.build();
        _$failedField = 'photos';
        photos.build();

        _$failedField = 'personality';
        personality.build();

        _$failedField = 'deliveryStatuses';
        _deliveryStatuses?.build();

        _$failedField = 'deliveryInfo';
        deliveryInfo.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DogAd', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
