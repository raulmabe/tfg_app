part of 'search_ads_bloc.dart';

@immutable
abstract class SearchAdsState {}

class SearchAdsInitial extends SearchAdsState {}

class SearchAdsLoading extends SearchAdsState {}

class SearchAdsSuccess extends SearchAdsState {
  final List<AnimalAd> animalAds;
  final List<ProductAd> productAds;
  final List<ServiceAd> serviceAds;
  SearchAdsSuccess(
      {this.animalAds = const [],
      this.productAds = const [],
      this.serviceAds = const []});
}

class SearchAdsFailure extends SearchAdsState {}
