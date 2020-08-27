part of 'ads_bloc.dart';

@immutable
abstract class AdsEvent {}

class LastAdsRefreshed extends AdsEvent {}

class MoreAdsFetched extends AdsEvent {
  final int photosWidth, photosHeight, thumbnailWidth, thumbnailHeight;
  MoreAdsFetched(
      {this.photosHeight,
      this.photosWidth,
      this.thumbnailHeight,
      this.thumbnailWidth});
}

class AdsFetched extends AdsEvent {
  final int photosWidth, photosHeight, thumbnailWidth, thumbnailHeight;

  AdsFetched({
    this.photosHeight,
    this.photosWidth,
    this.thumbnailHeight,
    this.thumbnailWidth,
  });
}

class AdsSearched extends AdsEvent {
  final String text;
  final DogSize size;
  final List<DeliveryStatus> deliveryInfo;
  final bool male;
  final ActivityLevel activityLevel;
  final String creator;
  AdsSearched(
      {this.text,
      this.size,
      this.deliveryInfo,
      this.male,
      this.activityLevel,
      this.creator});
}

class SearchModeDisabled extends AdsEvent {}

class CategorySelected extends AdsEvent {
  final Category category;
  CategorySelected({
    this.category,
  });

  @override
  String toString() {
    return 'Category event with $category';
  }
}
