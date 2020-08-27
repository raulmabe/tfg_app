import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/locale_bloc/locale_bloc.dart';
import 'package:jumpets_app/models/wrappers/auth_status.dart';
import 'package:jumpets_app/ui/helper.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        title: Text(
          AppLocalizations.of(context).translate('settings'),
          style: Theme.of(context).textTheme.headline3,
        ),
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.grey),
      ),
      body: ListView(
        children: <Widget>[
          Divider(
            color: Colors.transparent,
          ),
          _header(AppLocalizations.of(context).translate('account'), context),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state.authStatus.status ==
                  AuthenticationStatus.authenticated) {
                return Column(
                  children: [
                    ListTile(
                      title:
                          Text(AppLocalizations.of(context).translate('email')),
                      subtitle: Text(state.authStatus.authData.user.email),
                      dense: true,
                    ),
                    ListTile(
                      title: Text(
                          AppLocalizations.of(context).translate('password')),
                      subtitle: Text('*****'),
                      dense: true,
                    ),
                    Divider(),
                    ListTile(
                      trailing: Icon(Icons.exit_to_app),
                      title: Text(
                          AppLocalizations.of(context).translate('log_out')),
                      onTap: () =>
                          context.bloc<AuthBloc>().add(AuthLogoutRequested()),
                      dense: true,
                    ),
                  ],
                );
              }
              return ListTile(
                onTap: () => Helper.showLoginBottomSheet(context),
                title: Text(AppLocalizations.of(context)
                    .translate('identify_yourself')),
                subtitle: Text(
                    AppLocalizations.of(context).translate('not_signed_in')),
                dense: false,
              );
            },
          ),
          Divider(),
          _header(AppLocalizations.of(context).translate('advanced_settings'),
              context),
          ListTile(
            title: Text(AppLocalizations.of(context).translate('language')),
            dense: true,
            trailing: DropdownButton<String>(
              value: AppLocalizations.of(context)
                  .locale
                  .languageCode
                  .toLowerCase(),
              isDense: true,
              items: [
                DropdownMenuItem<String>(
                  value: 'en',
                  child: Text(AppLocalizations.of(context).translate('en')),
                ),
                DropdownMenuItem<String>(
                    value: 'es',
                    child: Text(AppLocalizations.of(context).translate('es'))),
                DropdownMenuItem<String>(
                    value: 'ca',
                    child: Text(AppLocalizations.of(context).translate('ca'))),
              ],
              onChanged: (idioma) =>
                  context.bloc<LocaleBloc>().add(LocaleChanged(idioma)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _header(String text, context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(
        text,
        style: TextStyle(color: Theme.of(context).accentColor),
      ),
    );
  }
}
