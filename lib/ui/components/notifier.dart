import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:jumpets_app/blocs/info_handler_bloc/info_handler_bloc.dart';
import 'package:jumpets_app/ui/app_theme.dart';
import 'package:jumpets_app/ui/components/buttons/flat_button.dart';
import 'package:jumpets_app/ui/components/buttons/raised_button.dart';
import 'package:overlay_support/overlay_support.dart';

// * Este widget tiene que ir debajo de un Scaffold
class Notifier extends StatelessWidget {
  final Widget child;
  Notifier({this.child});
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocListener<ErrorHandlerBloc, ErrorHandlerState>(
        listener: _errorListener,
        child: BlocListener<InfoHandlerBloc, InfoHandlerState>(
          listener: _infoListener,
          child: child,
        ),
      );
    });
  }

  void _infoListener(context, InfoHandlerState state) {
    if (state is InfoDialog) {
      showDialog(
          context: context,
          builder: (context) => MyAlertDialog(
                icon: Icon(
                  Icons.info_outline,
                  color: AppTheme.kThirdColor.withOpacity(.7),
                  size: 65,
                ),
                msg: AppLocalizations.of(context).translate(state.msg),
              ));
    } else if (state is InfoNotification) {
      showOverlayNotification((context) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: MyNotification(
              msg: AppLocalizations.of(context).translate(state.msg),
              color: AppTheme.kThirdColor,
              leading: Icon(
                Icons.info,
                color: AppTheme.kThirdColor,
                size: 30,
              ),
            ));
      }, duration: Duration(seconds: 4));
    }
  }

  void _errorListener(context, ErrorHandlerState state) {
    if (state is ErrorThrownDialog) {
      showDialog(
          context: context,
          builder: (context) => MyAlertDialog(
                  icon: Icon(
                    Icons.error_outline,
                    color: Theme.of(context).errorColor.withOpacity(.7),
                    size: 65,
                  ),
                  msg: AppLocalizations.of(context)
                          .translate(state.error.toString()) ??
                      state.error.toString(),
                  actions: [
                    FractionallySizedBox(
                      widthFactor: .7,
                      child: Row(
                        children: [
                          Expanded(
                            child: MyRaisedButton(
                              text: AppLocalizations.of(context)
                                  .translate('retry'),
                              onPressed: () {
                                state.retry();
                                Navigator.pop(context);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: .7,
                      child: Row(
                        children: [
                          Expanded(
                            child: MyRaisedButton(
                              filled: false,
                              text: AppLocalizations.of(context)
                                  .translate('cancel'),
                              textColor: Theme.of(context).accentColor,
                              onPressed: () => Navigator.pop(context),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]));
    } else if (state is ErrorThrownNotification) {
      showOverlayNotification((context) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: MyNotification(
              msg: AppLocalizations.of(context)
                      .translate(state.error.toString()) ??
                  state.error.toString(),
              color: Theme.of(context).errorColor,
              leading: Icon(
                Icons.error,
                color: Theme.of(context).errorColor,
                size: 30,
              ),
            ));
      }, duration: Duration(seconds: 4));
    }
  }
}

class MyAlertDialog extends StatelessWidget {
  final Icon icon;
  final String msg;
  final List<Widget> actions;

  MyAlertDialog({this.actions, this.icon, @required this.msg})
      : assert(msg != null);

  final ValueNotifier<bool> notifierStartup = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      notifierStartup.value = true;
    });
    return ValueListenableBuilder(
      valueListenable: notifierStartup,
      child: AlertDialog(
        title: icon,
        content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                msg,
                style:
                    Theme.of(context).textTheme.caption.copyWith(fontSize: 23),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
            ]
              ..addAll(actions ?? [])
              ..add(actions == null || actions.isEmpty
                  ? FractionallySizedBox(
                      widthFactor: .7,
                      child: Row(
                        children: [
                          Expanded(
                            child: MyRaisedButton(
                              text: AppLocalizations.of(context)
                                  .translate('okay'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  : Container())),
      ),
      builder: (context, value, child) => AnimatedPadding(
          duration: Duration(milliseconds: 250),
          padding: EdgeInsets.only(top: value ? 0 : 100),
          child: AnimatedOpacity(
              curve: Curves.ease,
              duration: Duration(milliseconds: 250),
              opacity: value ? 1 : 0,
              child: child)),
    );
  }
}

class MyNotification extends StatelessWidget {
  final String msg;
  final Widget trailing;
  final Widget leading;
  final Color color;

  MyNotification({this.color, @required this.msg, this.trailing, this.leading})
      : assert(msg != null);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                border: Border(
                    left: BorderSide(
                        color: color ?? Theme.of(context).accentColor,
                        style: BorderStyle.solid,
                        width: 4.0))),
            child: ListTile(
              leading: leading,
              title: Text(msg),
              trailing: trailing ??
                  IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        OverlaySupportEntry.of(context).dismiss();
                      }),
            ),
          ),
        ),
      ),
    );
  }
}
