part of 'valuations_bloc.dart';

@immutable
class ValuationsState {
  const ValuationsState(
      {this.status = FormzStatus.pure,
      this.comment = const Comment.pure(),
      this.value = 0,
      this.user});

  final FormzStatus status;
  final Comment comment;
  final double value;
  final User user;

  ValuationsState copyWith({
    FormzStatus status,
    Comment comment,
    double value,
    User user,
  }) {
    return ValuationsState(
      user: user ?? this.user,
      status: status ?? this.status,
      comment: comment ?? this.comment,
      value: value ?? this.value,
    );
  }

  @override
  String toString() {
    return '$value:${comment.value} ${status.toString()}';
  }
}
