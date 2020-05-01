import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/models/enums/categories.dart';
import 'package:jumpets_app/models/state/app_state.dart';
import 'package:built_collection/built_collection.dart';
import 'package:jumpets_app/redux/actions/actions.dart';

AppState reducer(AppState prevState, action) {
  return AppState((b) => b
    ..adsState.selectedCategory =
        changeCategoryReducer(prevState.adsState.selectedCategory, action)
    ..adsState.animalAds = ListBuilder<AnimalAd>(
        reducerAds(prevState.adsState.animalAds.toList(), action).toList()));
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
