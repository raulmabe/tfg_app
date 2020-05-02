import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:jumpets_app/models/ads/ad.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/models/enums/categories.dart';
import 'package:jumpets_app/models/state/app_state.dart';
import 'package:jumpets_app/redux/actions/actions.dart';
import 'package:jumpets_app/ui/ad_page/ad_page.dart';
import 'package:jumpets_app/ui/home_page/home_page.dart';
import 'package:redux/redux.dart';

class AdPageBuilder extends StatelessWidget {
  final AnimalAd ad;
  AdPageBuilder({@required this.ad});
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AdPageViewModel>(
      converter: (store) => AdPageViewModel.create(store),
      builder: (context, viewModel) => AdPage(
        viewModel: viewModel,
        ad: ad,
      ),
    );
  }
}

class AdPageViewModel {
  AdPageViewModel();

  factory AdPageViewModel.create(Store<AppState> store) {
    return AdPageViewModel();
  }
}
