part of 'ads_bloc.dart';

@immutable
abstract class AdsState {
  final Category category;
  AdsState({this.category = Category.DOGS});
}

class AdsInitial extends AdsState {
  AdsInitial({category}) : super(category: category);
}

class AdsSuccess extends AdsState {
  final PaginatedAds paginatedAds;
  AdsSuccess({this.paginatedAds, category}) : super(category: category);
}

class AdsFailure extends AdsState {
  AdsFailure({category}) : super(category: category);
}
