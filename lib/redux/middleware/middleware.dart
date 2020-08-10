import 'package:jumpets_app/models/state/app_state.dart';
import 'package:jumpets_app/redux/actions/actions.dart';
import 'package:jumpets_app/services/web_service.dart';
import 'package:redux/redux.dart';

void appStateMiddleware(
    Store<AppState> store, action, NextDispatcher next, JumpetsAPI api) async {
  next(action);

  if (action is GetPaginatedAds) {
    api
        .getPaginatedAds(
            category: store.state.adsState.selectedCategory, action: action)
        .then((action) => store.dispatch(action));
  }
}
