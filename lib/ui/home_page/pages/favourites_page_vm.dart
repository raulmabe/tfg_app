import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/models/enums/categories.dart';
import 'package:jumpets_app/models/state/app_state.dart';
import 'package:jumpets_app/redux/actions/actions.dart';
import 'package:jumpets_app/ui/home_page/home_page.dart';
import 'package:jumpets_app/ui/home_page/pages/favourites_page.dart';
import 'package:redux/redux.dart';

class FavouritesPageBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FavouritesPageViewModel>(
      converter: (store) => FavouritesPageViewModel.create(store),
      onInit: (store) {
        if (store.state.adsState.animalAds.isEmpty) {
          store.dispatch(GetFavAds());
        }
      },
      builder: (context, viewModel) => FavouritesPage(viewModel: viewModel),
    );
  }
}

class FavouritesPageViewModel {
  FavouritesPageViewModel();

  factory FavouritesPageViewModel.create(Store<AppState> store) {
    return FavouritesPageViewModel();
  }
}
