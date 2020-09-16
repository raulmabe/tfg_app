import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:jumpets_app/blocs/info_handler_bloc/info_handler_bloc.dart';
import 'package:jumpets_app/blocs/rooms_bloc/rooms_bloc.dart';
import 'package:jumpets_app/ui/app_theme.dart';
import 'package:jumpets_app/ui/components/animated_gradient_icon.dart';
import 'package:jumpets_app/ui/components/buttons/raised_button.dart';
import 'package:jumpets_app/ui/components/profile_icon.dart';
import 'package:overlay_support/overlay_support.dart';

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
    switch (state.runtimeType) {
      case InfoDialog:
        showDialog(
            context: context,
            builder: (context) => MyAlertDialog(
                  icon: AnimatedGradientIcon(
                    Icons.info_outline,
                    isSelected: true,
                    size: 65,
                  ),
                  msg: AppLocalizations.of(context)
                      .translate((state as InfoDialog).msg),
                ));
        break;

      case InfoNotification:
        showOverlayNotification((context) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: MyNotification(
                msg: AppLocalizations.of(context)
                    .translate((state as InfoNotification).msg),
                color: AppTheme.kThirdColor,
                leading: AnimatedGradientIcon(
                  Icons.info,
                  isSelected: false,
                  size: 30,
                ),
              ));
        }, duration: Duration(seconds: 4));
        break;

      case ChatMessage:
        showOverlayNotification((context) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: MyNotification(
                  msg:
                      '${(state as ChatMessage).msg.sender.name}: ${(state as ChatMessage).msg.text}',
                  leading: CircularProfileThumb(
                      user: (state as ChatMessage).msg.sender)));
        }, duration: Duration(seconds: 4));
        break;

      case InfoDialogAction:
        showDialog(
            context: context,
            builder: (context) => MyAlertDialog(
                  msg: AppLocalizations.of(context)
                      .translate((state as InfoDialogAction).msg),
                  actions: [
                    Spacer(),
                    Expanded(
                      flex: 2,
                      child: MyRaisedButton(
                        filled: false,
                        textColor: Theme.of(context).accentColor,
                        borders: false,
                        text: AppLocalizations.of(context).translate(
                            (state as InfoDialogAction).onSecondaryText),
                        onPressed:
                            (state as InfoDialogAction).onSecondaryCallback,
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 2,
                      child: MyRaisedButton(
                        text: AppLocalizations.of(context)
                            .translate((state as InfoDialogAction).onMainText),
                        onPressed: (state as InfoDialogAction).onMainCallback,
                      ),
                    ),
                    Spacer(),
                  ],
                ));
        break;
      default:
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
                    Expanded(
                      child: MyRaisedButton(
                        filled: false,
                        textColor: Theme.of(context).accentColor,
                        borders: false,
                        text: AppLocalizations.of(context).translate('retry'),
                        onPressed: () {
                          state.retry();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Expanded(
                      child: MyRaisedButton(
                        text: AppLocalizations.of(context).translate('cancel'),
                        onPressed: () => Navigator.pop(context),
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
  final Widget icon;
  final String msg;
  final List<Widget> actions;

  MyAlertDialog({this.actions, this.icon, @required this.msg})
      : assert(msg != null);

  final ValueNotifier<bool> notifierStartup = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      notifierStartup.value = true;
    });
    return ValueListenableBuilder(
      valueListenable: notifierStartup,
      child: AlertDialog(
        title: icon,
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            msg,
            style: Theme.of(context).textTheme.caption.copyWith(fontSize: 23),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          Row(children: [
            if (actions != null && actions.isNotEmpty)
              ...actions
            else
              Expanded(
                child: MyRaisedButton(
                  text: AppLocalizations.of(context).translate('okay'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
          ]),
        ]),
      ),
      builder: (context, value, child) => AnimatedPadding(
          duration: Duration(milliseconds: 250),
          curve: Curves.ease,
          padding: EdgeInsets.only(top: value ? 0 : 75),
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
  final Function onTap;

  MyNotification(
      {this.color, @required this.msg, this.trailing, this.leading, this.onTap})
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
              onTap: () {
                onTap();
                OverlaySupportEntry.of(context).dismiss();
              },
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
