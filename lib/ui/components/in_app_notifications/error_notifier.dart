import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:jumpets_app/models/state/app_state.dart';
import 'package:jumpets_app/redux/actions/actions.dart';
import 'package:jumpets_app/ui/components/in_app_notifications/base_notification.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:redux/redux.dart';

class ErrorNotifier extends StatelessWidget {
  ErrorNotifier({
    @required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.fromStore(store),
      builder: (context, vm) => child,
      onWillChange: (oldVm, newVm) {
        if (newVm.error != null) {
          newVm.markErrorAsHandled();

          showOverlayNotification(
            (context) {
              return BaseNotification(
                text: newVm.error,
                success: false,
              );
            },
            duration: Duration(seconds: 5),
          );
        }
      },
      distinct: true,
    );
  }
}

class _ViewModel {
  _ViewModel({
    this.markErrorAsHandled,
    this.error,
  });

  final Function markErrorAsHandled;
  final String error;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      markErrorAsHandled: () => store.dispatch(ErrorHandledAction()),
      error: store.state.errorsState.error,
    );
  }

  @override
  int get hashCode => error.hashCode;

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is _ViewModel && other.error == this.error;
}
