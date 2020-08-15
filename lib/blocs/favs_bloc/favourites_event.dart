part of 'favourites_bloc.dart';

@immutable
abstract class FavouritesEvent {}

class FavouriteAdAdded extends FavouritesEvent {
  final Ad ad;

  FavouriteAdAdded({this.ad});
}

class FavouriteAdRemoved extends FavouritesEvent {
  final String adId;

  FavouriteAdRemoved({this.adId});
}

class FavouritesFetched extends FavouritesEvent {}
