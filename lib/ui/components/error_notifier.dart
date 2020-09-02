import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:jumpets_app/ui/components/buttons/flat_button.dart';
import 'package:jumpets_app/ui/components/buttons/raised_button.dart';
import 'package:overlay_support/overlay_support.dart';

// * Este widget tiene que ir debajo de un Scaffold
class ErrorNotifier extends StatelessWidget {
  final Widget child;
  ErrorNotifier({this.child});
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocListener<ErrorHandlerBloc, ErrorHandlerState>(
        listener: (context, state) {
          if (state is ErrorThrownDialog) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Icon(
                        Icons.error_outline,
                        color: Theme.of(context).errorColor.withOpacity(.7),
                        size: 65,
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            AppLocalizations.of(context)
                                    .translate(state.error.toString()) ??
                                state.error.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(fontSize: 23),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 30,
                          ),
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
                        ],
                      ),
                    ));
          } else if (state is ErrorThrownSnackbar) {
            showOverlayNotification((context) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SafeArea(
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
                                    color: Theme.of(context).errorColor,
                                    style: BorderStyle.solid,
                                    width: 4.0))),
                        child: ListTile(
                          leading: Icon(
                            Icons.error,
                            color: Theme.of(context).errorColor.withOpacity(.7),
                            size: 30,
                          ),
                          title: Text(AppLocalizations.of(context)
                                  .translate(state.error.toString()) ??
                              state.error.toString()),
                          trailing: IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                OverlaySupportEntry.of(context).dismiss();
                              }),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }, duration: Duration(seconds: 4));
          }
        },
        child: child,
      );
    });
  }
}
