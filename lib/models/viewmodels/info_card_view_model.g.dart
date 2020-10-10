// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_card_view_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InfoCardViewModel> _$infoCardViewModelSerializer =
    new _$InfoCardViewModelSerializer();

class _$InfoCardViewModelSerializer
    implements StructuredSerializer<InfoCardViewModel> {
  @override
  final Iterable<Type> types = const [InfoCardViewModel, _$InfoCardViewModel];
  @override
  final String wireName = 'InfoCardViewModel';

  @override
  Iterable<Object> serialize(Serializers serializers, InfoCardViewModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'msg',
      serializers.serialize(object.msg, specifiedType: const FullType(String)),
    ];
    if (object.url != null) {
      result
        ..add('url')
        ..add(serializers.serialize(object.url,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  InfoCardViewModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InfoCardViewModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'msg':
          result.msg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$InfoCardViewModel extends InfoCardViewModel {
  @override
  final String title;
  @override
  final String msg;
  @override
  final String url;

  factory _$InfoCardViewModel(
          [void Function(InfoCardViewModelBuilder) updates]) =>
      (new InfoCardViewModelBuilder()..update(updates)).build();

  _$InfoCardViewModel._({this.title, this.msg, this.url}) : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('InfoCardViewModel', 'title');
    }
    if (msg == null) {
      throw new BuiltValueNullFieldError('InfoCardViewModel', 'msg');
    }
  }

  @override
  InfoCardViewModel rebuild(void Function(InfoCardViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InfoCardViewModelBuilder toBuilder() =>
      new InfoCardViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InfoCardViewModel &&
        title == other.title &&
        msg == other.msg &&
        url == other.url;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, title.hashCode), msg.hashCode), url.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InfoCardViewModel')
          ..add('title', title)
          ..add('msg', msg)
          ..add('url', url))
        .toString();
  }
}

class InfoCardViewModelBuilder
    implements Builder<InfoCardViewModel, InfoCardViewModelBuilder> {
  _$InfoCardViewModel _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _msg;
  String get msg => _$this._msg;
  set msg(String msg) => _$this._msg = msg;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  InfoCardViewModelBuilder();

  InfoCardViewModelBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _msg = _$v.msg;
      _url = _$v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InfoCardViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InfoCardViewModel;
  }

  @override
  void update(void Function(InfoCardViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InfoCardViewModel build() {
    final _$result =
        _$v ?? new _$InfoCardViewModel._(title: title, msg: msg, url: url);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
