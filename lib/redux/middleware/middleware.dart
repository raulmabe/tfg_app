import 'package:jumpets_app/models/state/app_state.dart';
import 'package:jumpets_app/redux/actions/actions.dart';
import 'package:jumpets_app/services/web_service.dart';
import 'package:redux/redux.dart';

void appStateMiddleware(
    Store<AppState> store, action, NextDispatcher next, JumpetsAPI api) async {
  next(action);

  if (action is GetAnimalAds) {
    try {
      var ads = await api.getAnimalAds();
      store.dispatch(GotAnimalAds(ads: ads, error: null));
    } catch (e) {
      store.dispatch(GotAnimalAds(ads: null, error: e.toString()));
    }

    /* api.getAnimalAds()
      ..then((ads) => store.dispatch(GotAnimalAds(ads: ads, error: null)))
      ..catchError(
          (e) => store.dispatch(GotAnimalAds(ads: null, error: e.toString()))); */

    action.completer.complete();
  }
}
