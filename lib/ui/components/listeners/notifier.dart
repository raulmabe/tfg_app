import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:jumpets_app/blocs/info_handler_bloc/info_handler_bloc.dart';
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
        listenWhen: (previous, current) => current is! ErrorHandlerEmpty,
        listener: _errorListener,
        child: BlocListener<InfoHandlerBloc, InfoHandlerState>(
          listenWhen: (previous, current) => current is! InfoHandlerEmpty,
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
            builder: (context) => SoloAlertDialog(
                  icon: AnimatedGradientIcon(
                    CupertinoIcons.info_circle,
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
                color: AppTheme.kFourthColor,
                leading: AnimatedGradientIcon(
                  CupertinoIcons.info,
                  isSelected: false,
                  offColors: [
                    AppTheme.kAccentColor,
                    AppTheme.kFourthColor,
                  ],
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
                  color: AppTheme.kFourthColor,
                  msg:
                      '${(state as ChatMessage).msg.sender.name}: ${(state as ChatMessage).msg.text}',
                  leading: CircularProfileThumb(
                      user: (state as ChatMessage).msg.sender)));
        }, duration: Duration(seconds: 4));
        break;

      case InfoDialogAction:
        showDialog(
            context: context,
            builder: (context) => SoloAlertDialog(
                  icon: AnimatedGradientIcon(
                    CupertinoIcons.info_circle,
                    isSelected: true,
                    size: 65,
                  ),
                  msg: AppLocalizations.of(context)
                      .translate((state as InfoDialogAction).msg),
                  mainButton: AppLocalizations.of(context)
                      .translate((state as InfoDialogAction).onMainText),
                  secondaryButton: AppLocalizations.of(context)
                      .translate((state as InfoDialogAction).onSecondaryText),
                  onDismissed: (button) {
                    if (button == DialogButtons.MAIN) {
                      if ((state as InfoDialogAction).onMainCallback != null)
                        (state as InfoDialogAction).onMainCallback();
                    } else {
                      if ((state as InfoDialogAction).onSecondaryCallback !=
                          null)
                        (state as InfoDialogAction).onSecondaryCallback();
                    }
                  },
                ));
        break;
      default:
    }
  }

  void _errorListener(context, ErrorHandlerState state) {
    if (state is ErrorThrownDialog) {
      showDialog(
          context: context,
          builder: (context) => SoloAlertDialog(
                icon: Icon(
                  Icons.error_outline,
                  color: Theme.of(context).errorColor.withOpacity(.7),
                  size: 65,
                ),
                msg: AppLocalizations.of(context)
                        .translate(state.error.toString()) ??
                    state.error.toString(),
                secondaryButton:
                    AppLocalizations.of(context).translate('retry'),
                mainButton: AppLocalizations.of(context).translate('cancel'),
                onDismissed: (button) {
                  if (button == DialogButtons.SECONDARY) {
                    state.retry();
                  }
                },
              ));
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

enum DialogButtons { MAIN, SECONDARY }

class SoloAlertDialog extends StatelessWidget {
  final Widget icon;
  final String msg;

  final String mainButton;
  final String secondaryButton;

  final Function(DialogButtons) onDismissed;

  SoloAlertDialog(
      {this.mainButton,
      this.secondaryButton,
      this.icon,
      @required this.msg,
      this.onDismissed})
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
            Expanded(
              child: MyRaisedButton(
                text: mainButton ??
                    AppLocalizations.of(context).translate('okay'),
                onPressed: () {
                  if (onDismissed != null) onDismissed(DialogButtons.MAIN);
                  Navigator.pop(context);
                },
              ),
            ),
            if (secondaryButton != null)
              Expanded(
                child: MyRaisedButton(
                  filled: false,
                  textColor: Theme.of(context).accentColor,
                  borders: false,
                  text: secondaryButton,
                  onPressed: () {
                    if (onDismissed != null)
                      onDismissed(DialogButtons.SECONDARY);
                    Navigator.pop(context);
                  },
                ),
              ),
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
