// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'valuation.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Valuation> _$valuationSerializer = new _$ValuationSerializer();

class _$ValuationSerializer implements StructuredSerializer<Valuation> {
  @override
  final Iterable<Type> types = const [Valuation, _$Valuation];
  @override
  final String wireName = 'Valuation';

  @override
  Iterable<Object> serialize(Serializers serializers, Valuation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'author',
      serializers.serialize(object.author, specifiedType: const FullType(User)),
      'comment',
      serializers.serialize(object.comment,
          specifiedType: const FullType(String)),
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  Valuation deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ValuationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'author':
          result.author = serializers.deserialize(value,
              specifiedType: const FullType(User)) as User;
          break;
        case 'comment':
          result.comment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$Valuation extends Valuation {
  @override
  final User author;
  @override
  final String comment;
  @override
  final double value;

  factory _$Valuation([void Function(ValuationBuilder) updates]) =>
      (new ValuationBuilder()..update(updates)).build();

  _$Valuation._({this.author, this.comment, this.value}) : super._() {
    if (author == null) {
      throw new BuiltValueNullFieldError('Valuation', 'author');
    }
    if (comment == null) {
      throw new BuiltValueNullFieldError('Valuation', 'comment');
    }
    if (value == null) {
      throw new BuiltValueNullFieldError('Valuation', 'value');
    }
  }

  @override
  Valuation rebuild(void Function(ValuationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValuationBuilder toBuilder() => new ValuationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Valuation &&
        author == other.author &&
        comment == other.comment &&
        value == other.value;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, author.hashCode), comment.hashCode), value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Valuation')
          ..add('author', author)
          ..add('comment', comment)
          ..add('value', value))
        .toString();
  }
}

class ValuationBuilder implements Builder<Valuation, ValuationBuilder> {
  _$Valuation _$v;

  User _author;
  User get author => _$this._author;
  set author(User author) => _$this._author = author;

  String _comment;
  String get comment => _$this._comment;
  set comment(String comment) => _$this._comment = comment;

  double _value;
  double get value => _$this._value;
  set value(double value) => _$this._value = value;

  ValuationBuilder();

  ValuationBuilder get _$this {
    if (_$v != null) {
      _author = _$v.author;
      _comment = _$v.comment;
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Valuation other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Valuation;
  }

  @override
  void update(void Function(ValuationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Valuation build() {
    final _$result = _$v ??
        new _$Valuation._(author: author, comment: comment, value: value);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
