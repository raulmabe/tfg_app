part of 'ads_bloc.dart';

@immutable
abstract class AdsState {
  AdsState();
}

class AdsInitial extends AdsState {}

class AdsLoading extends AdsState {}

class AdsSuccess extends AdsState {
  final PaginatedAds paginatedAds;
  final List<Protectora> shelters;
  AdsSuccess({this.paginatedAds, this.shelters});
}

class AdsFailure extends AdsState {}

class CategoryChanged extends AdsState {
  final category;
  CategoryChanged({this.category});
}
