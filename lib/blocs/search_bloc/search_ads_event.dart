part of 'search_ads_bloc.dart';

@immutable
abstract class SearchAdsEvent {}

class AdsSearched extends SearchAdsEvent {
  final String text;
  final DogSize size;
  final List<DeliveryStatus> deliveryInfo;
  final bool male;
  final ActivityLevel activityLevel;
  final AnimalType type;
  final String creator;
  AdsSearched(
      {this.text,
      this.size,
      this.deliveryInfo,
      this.male,
      this.activityLevel,
      this.type,
      this.creator});
}
