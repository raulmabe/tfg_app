import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/models/enums/categories.dart';
import 'package:jumpets_app/models/state/app_state.dart';
import 'package:jumpets_app/redux/actions/actions.dart';
import 'package:jumpets_app/ui/home_page/home_page.dart';
import 'package:jumpets_app/ui/home_page/pages/main_page.dart';
import 'package:redux/redux.dart';

class MainPageBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainPageViewModel>(
      converter: (store) => MainPageViewModel.create(store),
      onInit: (store) {
        if (store.state.adsState.animalAds.isEmpty) {
          print('YEAAAAA');
          store.dispatch(GetAnimalAds(completer: new Completer()));
        }
      },
      builder: (context, viewModel) => MainPage(viewModel: viewModel),
    );
  }
}

class MainPageViewModel {
  final List<AnimalAd> animalAds;
  final Function onRefreshAnimalAds;
  final Category category;
  MainPageViewModel(
      {@required this.animalAds,
      @required this.onRefreshAnimalAds,
      @required this.category});

  factory MainPageViewModel.create(Store<AppState> store) {
    _onRefreshAnimalAds() {
      Completer completer = new Completer();
      store.dispatch(GetAnimalAds(completer: completer));
      return completer.future;
    }

    return MainPageViewModel(
        animalAds: store.state.adsState.animalAds.toList(),
        onRefreshAnimalAds: _onRefreshAnimalAds,
        category: store.state.adsState.selectedCategory);
  }
}
