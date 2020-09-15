part of 'favourites_bloc.dart';

@immutable
abstract class FavouritesState {}

class FavouritesInitial extends FavouritesState {}

class FavouritesLoading extends FavouritesState {}

class FavouritesSuccess extends FavouritesState {
  final List<Ad> ads;
  FavouritesSuccess({this.ads});
}

class FavouritesFailure extends FavouritesState {
  final Function retry;
  final String msg;
  FavouritesFailure({this.retry, this.msg});
}
