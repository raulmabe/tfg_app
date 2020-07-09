import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:jumpets_app/models/state/app_state.dart';
import 'package:jumpets_app/redux/middleware/middleware.dart';
import 'package:jumpets_app/redux/reducers/reducers.dart';
import 'package:jumpets_app/services/web_service.dart';
import 'package:jumpets_app/ui/app_theme.dart';
import 'package:jumpets_app/ui/components/in_app_notifications/error_notifier.dart';
import 'package:jumpets_app/ui/home_page/home_page_vm.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Store<AppState> store =
      Store<AppState>(reducer, initialState: AppState.initial(), middleware: [
    (store, action, dispatcher) =>
        appStateMiddleware(store, action, dispatcher, JumpetsAPI()),
    new LoggingMiddleware.printer()
  ]);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: OverlaySupport(
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.getTheme(),
          home: ErrorNotifier(child: HomePageBuilder()),
        ),
      ),
    );
  }
}
