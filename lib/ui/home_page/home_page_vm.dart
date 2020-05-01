import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/models/enums/categories.dart';
import 'package:jumpets_app/models/state/app_state.dart';
import 'package:jumpets_app/redux/actions/actions.dart';
import 'package:jumpets_app/ui/home_page/home_page.dart';
import 'package:redux/redux.dart';

class HomePageBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomePageViewModel>(
      converter: (store) => HomePageViewModel.create(store),
      builder: (context, viewModel) => HomePage(viewModel: viewModel),
    );
  }
}

class HomePageViewModel {
  HomePageViewModel();

  factory HomePageViewModel.create(Store<AppState> store) {
    return HomePageViewModel();
  }
}
