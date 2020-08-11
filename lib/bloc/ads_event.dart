part of 'ads_bloc.dart';

@immutable
abstract class AdsEvent {}

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
  AdsFetched(
      {this.photosHeight,
      this.photosWidth,
      this.thumbnailHeight,
      this.thumbnailWidth});
}

class CategorySelected extends AdsEvent {
  final Category category;
  CategorySelected({
    this.category,
  });

  @override
  String toString() {
    return 'Searching with $category';
  }
}
