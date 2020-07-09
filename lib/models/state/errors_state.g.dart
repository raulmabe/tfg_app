// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errors_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ErrorsState> _$errorsStateSerializer = new _$ErrorsStateSerializer();

class _$ErrorsStateSerializer implements StructuredSerializer<ErrorsState> {
  @override
  final Iterable<Type> types = const [ErrorsState, _$ErrorsState];
  @override
  final String wireName = 'ErrorsState';

  @override
  Iterable<Object> serialize(Serializers serializers, ErrorsState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'pendingActions',
      serializers.serialize(object.pendingActions,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Object)])),
    ];
    if (object.error != null) {
      result
        ..add('error')
        ..add(serializers.serialize(object.error,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ErrorsState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ErrorsStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pendingActions':
          result.pendingActions.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Object)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$ErrorsState extends ErrorsState {
  @override
  final String error;
  @override
  final BuiltList<Object> pendingActions;

  factory _$ErrorsState([void Function(ErrorsStateBuilder) updates]) =>
      (new ErrorsStateBuilder()..update(updates)).build();

  _$ErrorsState._({this.error, this.pendingActions}) : super._() {
    if (pendingActions == null) {
      throw new BuiltValueNullFieldError('ErrorsState', 'pendingActions');
    }
  }

  @override
  ErrorsState rebuild(void Function(ErrorsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ErrorsStateBuilder toBuilder() => new ErrorsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ErrorsState &&
        error == other.error &&
        pendingActions == other.pendingActions;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, error.hashCode), pendingActions.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ErrorsState')
          ..add('error', error)
          ..add('pendingActions', pendingActions))
        .toString();
  }
}

class ErrorsStateBuilder implements Builder<ErrorsState, ErrorsStateBuilder> {
  _$ErrorsState _$v;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  ListBuilder<Object> _pendingActions;
  ListBuilder<Object> get pendingActions =>
      _$this._pendingActions ??= new ListBuilder<Object>();
  set pendingActions(ListBuilder<Object> pendingActions) =>
      _$this._pendingActions = pendingActions;

  ErrorsStateBuilder();

  ErrorsStateBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _pendingActions = _$v.pendingActions?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ErrorsState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ErrorsState;
  }

  @override
  void update(void Function(ErrorsStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ErrorsState build() {
    _$ErrorsState _$result;
    try {
      _$result = _$v ??
          new _$ErrorsState._(
              error: error, pendingActions: pendingActions.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'pendingActions';
        pendingActions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ErrorsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
