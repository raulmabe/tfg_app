// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'protectora.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Protectora> _$protectoraSerializer = new _$ProtectoraSerializer();

class _$ProtectoraSerializer implements StructuredSerializer<Protectora> {
  @override
  final Iterable<Type> types = const [Protectora, _$Protectora];
  @override
  final String wireName = 'Protectora';

  @override
  Iterable<Object> serialize(Serializers serializers, Protectora object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(DateTime)),
      'updatedAt',
      serializers.serialize(object.updatedAt,
          specifiedType: const FullType(DateTime)),
    ];
    if (object.thumbnail != null) {
      result
        ..add('thumbnail')
        ..add(serializers.serialize(object.thumbnail,
            specifiedType: const FullType(String)));
    }
    if (object.address != null) {
      result
        ..add('address')
        ..add(serializers.serialize(object.address,
            specifiedType: const FullType(String)));
    }
    if (object.phone != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(object.phone,
            specifiedType: const FullType(int)));
    }
    if (object.password != null) {
      result
        ..add('password')
        ..add(serializers.serialize(object.password,
            specifiedType: const FullType(String)));
    }
    if (object.valuations != null) {
      result
        ..add('valuations')
        ..add(serializers.serialize(object.valuations,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Valuation)])));
    }
    if (object.web != null) {
      result
        ..add('web')
        ..add(serializers.serialize(object.web,
            specifiedType: const FullType(String)));
    }
    if (object.distance != null) {
      result
        ..add('distance')
        ..add(serializers.serialize(object.distance,
            specifiedType: const FullType(int)));
    }
    if (object.travelTime != null) {
      result
        ..add('travelTime')
        ..add(serializers.serialize(object.travelTime,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Protectora deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProtectoraBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'thumbnail':
          result.thumbnail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'updatedAt':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'valuations':
          result.valuations.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Valuation)]))
              as BuiltList<Object>);
          break;
        case 'web':
          result.web = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'distance':
          result.distance = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'travelTime':
          result.travelTime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Protectora extends Protectora {
  @override
  final String id;
  @override
  final String name;
  @override
  final String thumbnail;
  @override
  final String address;
  @override
  final int phone;
  @override
  final String email;
  @override
  final String password;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final BuiltList<Valuation> valuations;
  @override
  final String web;
  @override
  final int distance;
  @override
  final int travelTime;

  factory _$Protectora([void Function(ProtectoraBuilder) updates]) =>
      (new ProtectoraBuilder()..update(updates)).build();

  _$Protectora._(
      {this.id,
      this.name,
      this.thumbnail,
      this.address,
      this.phone,
      this.email,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.valuations,
      this.web,
      this.distance,
      this.travelTime})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Protectora', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Protectora', 'name');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('Protectora', 'email');
    }
    if (createdAt == null) {
      throw new BuiltValueNullFieldError('Protectora', 'createdAt');
    }
    if (updatedAt == null) {
      throw new BuiltValueNullFieldError('Protectora', 'updatedAt');
    }
  }

  @override
  Protectora rebuild(void Function(ProtectoraBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProtectoraBuilder toBuilder() => new ProtectoraBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Protectora &&
        id == other.id &&
        name == other.name &&
        thumbnail == other.thumbnail &&
        address == other.address &&
        phone == other.phone &&
        email == other.email &&
        password == other.password &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        valuations == other.valuations &&
        web == other.web &&
        distance == other.distance &&
        travelTime == other.travelTime;
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
                                                $jc($jc(0, id.hashCode),
                                                    name.hashCode),
                                                thumbnail.hashCode),
                                            address.hashCode),
                                        phone.hashCode),
                                    email.hashCode),
                                password.hashCode),
                            createdAt.hashCode),
                        updatedAt.hashCode),
                    valuations.hashCode),
                web.hashCode),
            distance.hashCode),
        travelTime.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Protectora')
          ..add('id', id)
          ..add('name', name)
          ..add('thumbnail', thumbnail)
          ..add('address', address)
          ..add('phone', phone)
          ..add('email', email)
          ..add('password', password)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('valuations', valuations)
          ..add('web', web)
          ..add('distance', distance)
          ..add('travelTime', travelTime))
        .toString();
  }
}

class ProtectoraBuilder implements Builder<Protectora, ProtectoraBuilder> {
  _$Protectora _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _thumbnail;
  String get thumbnail => _$this._thumbnail;
  set thumbnail(String thumbnail) => _$this._thumbnail = thumbnail;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  int _phone;
  int get phone => _$this._phone;
  set phone(int phone) => _$this._phone = phone;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  DateTime _createdAt;
  DateTime get createdAt => _$this._createdAt;
  set createdAt(DateTime createdAt) => _$this._createdAt = createdAt;

  DateTime _updatedAt;
  DateTime get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime updatedAt) => _$this._updatedAt = updatedAt;

  ListBuilder<Valuation> _valuations;
  ListBuilder<Valuation> get valuations =>
      _$this._valuations ??= new ListBuilder<Valuation>();
  set valuations(ListBuilder<Valuation> valuations) =>
      _$this._valuations = valuations;

  String _web;
  String get web => _$this._web;
  set web(String web) => _$this._web = web;

  int _distance;
  int get distance => _$this._distance;
  set distance(int distance) => _$this._distance = distance;

  int _travelTime;
  int get travelTime => _$this._travelTime;
  set travelTime(int travelTime) => _$this._travelTime = travelTime;

  ProtectoraBuilder();

  ProtectoraBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _thumbnail = _$v.thumbnail;
      _address = _$v.address;
      _phone = _$v.phone;
      _email = _$v.email;
      _password = _$v.password;
      _createdAt = _$v.createdAt;
      _updatedAt = _$v.updatedAt;
      _valuations = _$v.valuations?.toBuilder();
      _web = _$v.web;
      _distance = _$v.distance;
      _travelTime = _$v.travelTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Protectora other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Protectora;
  }

  @override
  void update(void Function(ProtectoraBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Protectora build() {
    _$Protectora _$result;
    try {
      _$result = _$v ??
          new _$Protectora._(
              id: id,
              name: name,
              thumbnail: thumbnail,
              address: address,
              phone: phone,
              email: email,
              password: password,
              createdAt: createdAt,
              updatedAt: updatedAt,
              valuations: _valuations?.build(),
              web: web,
              distance: distance,
              travelTime: travelTime);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'valuations';
        _valuations?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Protectora', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
