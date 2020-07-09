import 'dart:ffi';

import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/models/enums/categories.dart';
import 'package:jumpets_app/models/state/app_state.dart';
import 'package:built_collection/built_collection.dart';
import 'package:jumpets_app/models/state/errors_state.dart';
import 'package:jumpets_app/redux/actions/actions.dart';

AppState reducer(AppState prevState, action) {
  return AppState((b) => b
    ..adsState.selectedCategory =
        changeCategoryReducer(prevState.adsState.selectedCategory, action)
    ..adsState.animalAds = ListBuilder<AnimalAd>(
        reducerAds(prevState.adsState.animalAds.toList(), action).toList())
    ..errorsState =
        errorsStateReducer(prevState.errorsState, action).toBuilder());
}

ErrorsState errorsStateReducer(ErrorsState prev, action) {
  if (action is NetworkError && action.error != null) {
    List<Object> pendingActions = List<Object>.unmodifiable([]
      ..addAll(prev.pendingActions)
      ..add(action));

    return ErrorsState((b) => b
      ..pendingActions = BuiltList<Object>(pendingActions).toBuilder()
      ..error = action.error);
  }

  if (action is ErrorHandledAction) {
    return ErrorsState((b) => b
      ..pendingActions = prev.pendingActions.toBuilder()
      ..error = null);
  }
  return prev;
}

List<AnimalAd> reducerAds(List<AnimalAd> prevAnimalAds, action) {
  if (action is GotAnimalAds && action.error == null) {
    return action.ads;
  }
  return prevAnimalAds;
}

Category changeCategoryReducer(Category prevCategory, action) {
  if (action is SelectCategory) return action.category;
  return prevCategory;
}
