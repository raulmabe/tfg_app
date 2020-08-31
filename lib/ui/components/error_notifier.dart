import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:jumpets_app/ui/components/buttons/flat_button.dart';

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
                        Icons.warning,
                        color: Theme.of(context).errorColor.withOpacity(.7),
                        size: 60,
                      ),
                      content: Text(AppLocalizations.of(context)
                              .translate(state.error.toString()) ??
                          state.error.toString()),
                      actions: [
                        Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MyFlatButton(
                                child: Text(AppLocalizations.of(context)
                                    .translate('cancel')),
                                onTap: () => Navigator.pop(context),
                              ),
                              MyFlatButton(
                                child: Text(AppLocalizations.of(context)
                                    .translate('retry')),
                                onTap: () {
                                  state.retry();
                                  Navigator.pop(context);
                                },
                              ),
                            ])
                      ],
                    ));
          } else if (state is ErrorThrownSnackbar) {
            Scaffold.of(context)?.showSnackBar(SnackBar(
                content: Row(children: [
              Text(AppLocalizations.of(context).translate('error_title')),
              Expanded(
                child: Text(
                  AppLocalizations.of(context)
                          .translate(state.error.toString()) ??
                      state.error.toString(),
                ),
              ),
            ])));
          }
        },
        child: child,
      );
    });
  }
}
