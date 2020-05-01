// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profesional.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Profesional> _$profesionalSerializer = new _$ProfesionalSerializer();

class _$ProfesionalSerializer implements StructuredSerializer<Profesional> {
  @override
  final Iterable<Type> types = const [Profesional, _$Profesional];
  @override
  final String wireName = 'Profesional';

  @override
  Iterable<Object> serialize(Serializers serializers, Profesional object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'thumbnail',
      serializers.serialize(object.thumbnail,
          specifiedType: const FullType(String)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
      'phone',
      serializers.serialize(object.phone, specifiedType: const FullType(int)),
      'web',
      serializers.serialize(object.web, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Profesional deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProfesionalBuilder();

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
        case 'web':
          result.web = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Profesional extends Profesional {
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
  final String web;

  factory _$Profesional([void Function(ProfesionalBuilder) updates]) =>
      (new ProfesionalBuilder()..update(updates)).build();

  _$Profesional._(
      {this.id, this.name, this.thumbnail, this.address, this.phone, this.web})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Profesional', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Profesional', 'name');
    }
    if (thumbnail == null) {
      throw new BuiltValueNullFieldError('Profesional', 'thumbnail');
    }
    if (address == null) {
      throw new BuiltValueNullFieldError('Profesional', 'address');
    }
    if (phone == null) {
      throw new BuiltValueNullFieldError('Profesional', 'phone');
    }
    if (web == null) {
      throw new BuiltValueNullFieldError('Profesional', 'web');
    }
  }

  @override
  Profesional rebuild(void Function(ProfesionalBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfesionalBuilder toBuilder() => new ProfesionalBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Profesional &&
        id == other.id &&
        name == other.name &&
        thumbnail == other.thumbnail &&
        address == other.address &&
        phone == other.phone &&
        web == other.web;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, id.hashCode), name.hashCode),
                    thumbnail.hashCode),
                address.hashCode),
            phone.hashCode),
        web.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Profesional')
          ..add('id', id)
          ..add('name', name)
          ..add('thumbnail', thumbnail)
          ..add('address', address)
          ..add('phone', phone)
          ..add('web', web))
        .toString();
  }
}

class ProfesionalBuilder implements Builder<Profesional, ProfesionalBuilder> {
  _$Profesional _$v;

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

  String _web;
  String get web => _$this._web;
  set web(String web) => _$this._web = web;

  ProfesionalBuilder();

  ProfesionalBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _thumbnail = _$v.thumbnail;
      _address = _$v.address;
      _phone = _$v.phone;
      _web = _$v.web;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Profesional other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Profesional;
  }

  @override
  void update(void Function(ProfesionalBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Profesional build() {
    final _$result = _$v ??
        new _$Profesional._(
            id: id,
            name: name,
            thumbnail: thumbnail,
            address: address,
            phone: phone,
            web: web);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
