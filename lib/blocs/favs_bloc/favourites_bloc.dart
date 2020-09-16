import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:jumpets_app/data/repositories/ads_repository.dart';
import 'package:jumpets_app/models/ads/ad.dart';
import 'package:meta/meta.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  final AdsRepository repository;
  final AuthBloc authBloc;
  final ErrorHandlerBloc errorBloc;
  FavouritesBloc(
      {@required this.repository,
      @required this.authBloc,
      @required this.errorBloc})
      : assert(repository != null),
        assert(authBloc != null),
        assert(errorBloc != null),
        super(FavouritesInitial());

  @override
  Stream<FavouritesState> mapEventToState(
    FavouritesEvent event,
  ) async* {
    switch (event.runtimeType) {
      case FavouritesFetched:
        yield FavouritesLoading();
        yield await _mapFavouritesFetchedToState(event);
        break;
      case FavouriteAdAdded:
        yield FavouritesLoading();
        yield await _mapFavouritesAdAddedToState(event);
        break;
      case FavouriteAdRemoved:
        yield FavouritesLoading();
        yield await _mapFavouritesAdRemovedToState(event);
        break;
      case FavouriteInitialized:
        yield FavouritesInitial();
        break;
      default:
    }
  }

  Future<FavouritesState> _mapFavouritesAdRemovedToState(
      FavouriteAdRemoved event) async {
    try {
      List<Ad> favs = await repository.unsaveAd(token: token, id: event.adId);
      return FavouritesSuccess(ads: favs);
    } catch (err, stack) {
      errorBloc.add(ErrorHandlerCatched(
          bloc: this, event: event, error: err, notification: true));
      print('OnCatch $err, $stack');
      return FavouritesFailure(
          retry: () => this.add(event), msg: err.toString());
    }
  }

  Future<FavouritesState> _mapFavouritesAdAddedToState(
      FavouriteAdAdded event) async {
    try {
      List<Ad> favs = await repository.saveAd(token: token, id: event.ad.id);
      return FavouritesSuccess(ads: favs);
    } catch (err, stack) {
      errorBloc.add(ErrorHandlerCatched(
          bloc: this, event: event, error: err, notification: true));
      print('OnCatch $err, $stack');
      return FavouritesFailure(
          retry: () => this.add(event), msg: err.toString());
    }
  }

  Future<FavouritesState> _mapFavouritesFetchedToState(
      FavouritesFetched event) async {
    try {
      List<Ad> favs = await repository.getFavs(token: token);
      return FavouritesSuccess(ads: favs);
    } catch (err, stack) {
      print('OnCatch $err, $stack');
      return FavouritesFailure(
          retry: () => this.add(event), msg: err.toString());
    }
  }

  String get token => authBloc.state.authStatus?.authData?.token;
}
