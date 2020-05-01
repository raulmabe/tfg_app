import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:jumpets_app/models/state/app_state.dart';
import 'package:jumpets_app/redux/middleware/middleware.dart';
import 'package:jumpets_app/redux/reducers/reducers.dart';
import 'package:jumpets_app/services/web_service.dart';
import 'package:jumpets_app/ui/app_theme.dart';
import 'package:jumpets_app/ui/home_page/home_page_vm.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static JumpetsAPI webService =
      new JumpetsAPI(baseURI: 'http://192.168.1.129:5000/graphql');

  final Store<AppState> store =
      Store<AppState>(reducer, initialState: AppState.initial(), middleware: [
    (store, action, dispatcher) =>
        appStateMiddleware(store, action, dispatcher, webService),
    new LoggingMiddleware.printer()
  ]);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.getTheme(),
        home: HomePageBuilder(),
      ),
    );
  }
}
