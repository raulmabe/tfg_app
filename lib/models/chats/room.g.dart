// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Room> _$roomSerializer = new _$RoomSerializer();

class _$RoomSerializer implements StructuredSerializer<Room> {
  @override
  final Iterable<Type> types = const [Room, _$Room];
  @override
  final String wireName = 'Room';

  @override
  Iterable<Object> serialize(Serializers serializers, Room object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'user1',
      serializers.serialize(object.user1, specifiedType: const FullType(User)),
      'user2',
      serializers.serialize(object.user2, specifiedType: const FullType(User)),
      'messages',
      serializers.serialize(object.messages,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Message)])),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(DateTime)),
      'updatedAt',
      serializers.serialize(object.updatedAt,
          specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  Room deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RoomBuilder();

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
        case 'user1':
          result.user1 = serializers.deserialize(value,
              specifiedType: const FullType(User)) as User;
          break;
        case 'user2':
          result.user2 = serializers.deserialize(value,
              specifiedType: const FullType(User)) as User;
          break;
        case 'messages':
          result.messages.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Message)]))
              as BuiltList<Object>);
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'updatedAt':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$Room extends Room {
  @override
  final String id;
  @override
  final User user1;
  @override
  final User user2;
  @override
  final BuiltList<Message> messages;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  factory _$Room([void Function(RoomBuilder) updates]) =>
      (new RoomBuilder()..update(updates)).build();

  _$Room._(
      {this.id,
      this.user1,
      this.user2,
      this.messages,
      this.createdAt,
      this.updatedAt})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Room', 'id');
    }
    if (user1 == null) {
      throw new BuiltValueNullFieldError('Room', 'user1');
    }
    if (user2 == null) {
      throw new BuiltValueNullFieldError('Room', 'user2');
    }
    if (messages == null) {
      throw new BuiltValueNullFieldError('Room', 'messages');
    }
    if (createdAt == null) {
      throw new BuiltValueNullFieldError('Room', 'createdAt');
    }
    if (updatedAt == null) {
      throw new BuiltValueNullFieldError('Room', 'updatedAt');
    }
  }

  @override
  Room rebuild(void Function(RoomBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RoomBuilder toBuilder() => new RoomBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Room &&
        id == other.id &&
        user1 == other.user1 &&
        user2 == other.user2 &&
        messages == other.messages &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, id.hashCode), user1.hashCode), user2.hashCode),
                messages.hashCode),
            createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Room')
          ..add('id', id)
          ..add('user1', user1)
          ..add('user2', user2)
          ..add('messages', messages)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class RoomBuilder implements Builder<Room, RoomBuilder> {
  _$Room _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  User _user1;
  User get user1 => _$this._user1;
  set user1(User user1) => _$this._user1 = user1;

  User _user2;
  User get user2 => _$this._user2;
  set user2(User user2) => _$this._user2 = user2;

  ListBuilder<Message> _messages;
  ListBuilder<Message> get messages =>
      _$this._messages ??= new ListBuilder<Message>();
  set messages(ListBuilder<Message> messages) => _$this._messages = messages;

  DateTime _createdAt;
  DateTime get createdAt => _$this._createdAt;
  set createdAt(DateTime createdAt) => _$this._createdAt = createdAt;

  DateTime _updatedAt;
  DateTime get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime updatedAt) => _$this._updatedAt = updatedAt;

  RoomBuilder();

  RoomBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _user1 = _$v.user1;
      _user2 = _$v.user2;
      _messages = _$v.messages?.toBuilder();
      _createdAt = _$v.createdAt;
      _updatedAt = _$v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Room other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Room;
  }

  @override
  void update(void Function(RoomBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Room build() {
    _$Room _$result;
    try {
      _$result = _$v ??
          new _$Room._(
              id: id,
              user1: user1,
              user2: user2,
              messages: messages.build(),
              createdAt: createdAt,
              updatedAt: updatedAt);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'messages';
        messages.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Room', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
