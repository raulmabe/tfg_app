import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/ui/components/soft_transition.dart';
import 'package:jumpets_app/ui/components/login_form_components.dart';
import 'package:jumpets_app/ui/helper.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: new Color(0xfff8faf8),
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.display2,
        ),
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.grey),
      ),
      body: ListView(
        children: <Widget>[
          Divider(
            color: Colors.transparent,
          ),
          _header('Account', context),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state.authStatus == AuthenticationStatus.authenticated) {
                return Column(
                  children: [
                    ListTile(
                      title: Text('Email'),
                      subtitle: Text(state.authData.user.email),
                      dense: true,
                    ),
                    ListTile(
                      title: Text('Password'),
                      subtitle: Text('*****'),
                      dense: true,
                    ),
                    Divider(),
                    ListTile(
                      trailing: Icon(Icons.exit_to_app),
                      title: Text('Log out'),
                      onTap: () =>
                          context.bloc<AuthBloc>().add(AuthLogoutRequested()),
                      dense: true,
                    ),
                  ],
                );
              }
              return ListTile(
                onTap: () => Helper.showLoginBottomSheet(context),
                title: Text('Identify youserlf'),
                subtitle: Text('You are not signed in'),
                dense: false,
              );
            },
          ),
          Divider(),
          _header('Advanced Settings', context),
          /* ListTile(
            title: Text('Language'),
            dense: true,
            trailing: DropdownButton<String>(
              value: AppLocalizations.of(context)
                  .locale
                  .languageCode
                  .toLowerCase(),
              isDense: true,
              items: <String>[
                AppLocalizations.of(context).translate('en'),
                AppLocalizations.of(context).translate('es')
              ].map((idioma) {
                return DropdownMenuItem<String>(
                  value: AppLocalizations.of(context).translate(idioma),
                  child: Text(idioma),
                );
              }).toList(),
              onChanged: (idioma) => viewModel.changeLanguage(idioma),
            ),
          ), */
          /*  ListTile(
              title:
                  Text(AppLocalizations.of(context).translate('FactoryReset')),
              dense: true,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialogConfirm(
                    title:
                        AppLocalizations.of(context).translate('FactoryReset'),
                    text: AppLocalizations.of(context)
                        .translate('thisWillEraseYourData'),
                    onConfirm: () => viewModel.restoreToZero(() =>
                        Navigator.pushNamedAndRemoveUntil(
                            context, 'welcome', (_) => false)),
                  ),
                );
              }), */
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
