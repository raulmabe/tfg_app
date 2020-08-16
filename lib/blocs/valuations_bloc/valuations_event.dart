part of 'valuations_bloc.dart';

@immutable
abstract class ValuationsEvent {}

class ValuationCommentChanged extends ValuationsEvent {
  final String comment;
  ValuationCommentChanged(this.comment);
}

class ValuationValueChanged extends ValuationsEvent {
  final double value;
  ValuationValueChanged(this.value);
}

class ValuationSubmitted extends ValuationsEvent {
  final String id;
  ValuationSubmitted(this.id);
}

class ValuationDeleted extends ValuationsEvent {
  final String id;
  ValuationDeleted(this.id);
}
