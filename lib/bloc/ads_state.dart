part of 'ads_bloc.dart';

@immutable
abstract class AdsState {
  AdsState();
}

class AdsInitial extends AdsState {}

class AdsLoading extends AdsState {}

class AdsSuccess extends AdsState {
  final PaginatedAds paginatedAds;
  AdsSuccess({
    this.paginatedAds,
  });
}

class AdsFailure extends AdsState {}
