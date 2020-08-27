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
  final List<Ad> searchedAds;
  AdsSuccess({this.paginatedAds, this.shelters, this.searchedAds});
}

class AdsFailure extends AdsState {}

class CategoryChanged extends AdsState {
  final category;
  CategoryChanged({this.category});
}

class SearchModeChanged extends AdsState {
  final searchMode;
  SearchModeChanged(this.searchMode);
}
