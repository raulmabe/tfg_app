part of 'favourites_bloc.dart';

@immutable
abstract class FavouritesState extends Equatable {}

class FavouritesInitial extends FavouritesState {
  @override
  List<Object> get props => [];
}

class FavouritesLoading extends FavouritesState {
  @override
  List<Object> get props => [];
}

class FavouritesSuccess  extends FavouritesState {
  final List<Ad> ads;
  FavouritesSuccess({this.ads});

  @override
  bool get stringify => true;
  
  @override
  List<Object> get props => ads;
}

class FavouritesFailure extends FavouritesState {
  final Function retry;
  final String msg;
  FavouritesFailure({this.retry, this.msg});

  @override
  bool get stringify => true;
  @override
  List<Object> get props => [msg];
}
