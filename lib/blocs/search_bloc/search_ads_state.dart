part of 'search_ads_bloc.dart';

@immutable
abstract class SearchAdsState {}

class SearchAdsInitial extends SearchAdsState {}

class SearchAdsLoading extends SearchAdsState {}

class SearchAdsSuccess extends SearchAdsState {
  final List<Ad> ads;
  SearchAdsSuccess({this.ads = const []});
}

class SearchAdsFailure extends SearchAdsState {}
