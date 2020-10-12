part of 'ads_bloc.dart';

@immutable
abstract class AdsState {
  AdsState();
}

class AdsInitial extends AdsState {}

class AdsLoading extends AdsState {}

class AdsLoadingMore extends AdsState {
  final List<Ad> ads;
  final List<InfoCardViewModel> infoCards;
  AdsLoadingMore({this.ads, this.infoCards});
}

class AdsSuccess extends AdsState {
  final PaginatedAds paginatedAds;
  final List<Protectora> shelters;
  final List<Ad> searchedAds;
  final List<InfoCardViewModel> infoCards;
  AdsSuccess(
      {this.paginatedAds, this.shelters, this.searchedAds, this.infoCards});
}

class AdsFailure extends AdsState {
  final Function retry;
  final String msg;
  AdsFailure({this.retry, this.msg});
}

class CategoryChanged extends AdsState {
  final category;
  CategoryChanged({this.category});
}

class SearchModeChanged extends AdsState {
  final searchMode;
  SearchModeChanged(this.searchMode);
}
