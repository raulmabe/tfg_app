import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/locale_bloc/locale_bloc.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/models/wrappers/auth_status.dart';
import 'package:jumpets_app/ui/components/jumpets_icons_icons.dart';
import 'package:jumpets_app/ui/helper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;
import 'dart:io' show Platform;

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Text(
          AppLocalizations.of(context).translate('settings'),
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Divider(
            color: Colors.transparent,
          ),
          _header(AppLocalizations.of(context).translate('account'), context),
          _accountTiles(context),
          _header(AppLocalizations.of(context).translate('advanced_settings'),
              context),
          ListTile(
            title: Text(AppLocalizations.of(context).translate('language')),
            dense: false,
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
          ListTile(
            title: Text(AppLocalizations.of(context).translate('licenses')),
            onTap: () => showAboutDialog(
                context: context,
                applicationIcon: Icon(
                  JumpetsIcons.nariz_jumpets,
                  color: Theme.of(context).accentColor,
                ),
                applicationVersion: 'v1.0.0',
                applicationLegalese: AppLocalizations.of(context)
                    .translate('not_a_real_app_msg')),
            dense: false,
          ),
          if (Platform.isAndroid)
            ListTile(
              trailing: Icon(Icons.exit_to_app),
              title: Text(AppLocalizations.of(context).translate('exit_app')),
              onTap: () =>
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
              dense: false,
            ),
          _header(AppLocalizations.of(context).translate('about_me'), context),
          ListTile(
            title: Text(AppLocalizations.of(context).translate('social_media')),
            onTap: () => Helper.showSocialMediaBottomSheet(context),
            dense: false,
          ),
          ListTile(
            title: Text(
                '${AppLocalizations.of(context).translate('buy_me_a_coffee')} 🍺'),
            onTap: () async {
              if (await canLaunch('https://www.buymeacoffee.com/mabe')) {
                await launch('https://www.buymeacoffee.com/mabe');
              } else {
                throw 'Could not launch website';
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _accountTiles(context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.authStatus.status == AuthenticationStatus.authenticated) {
          return Column(
            children: [
              ExpansionTile(
                  title: Text(
                    AppLocalizations.of(context).translate('account_details'),
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  children: [
                    ListTile(
                      title:
                          Text(AppLocalizations.of(context).translate('name')),
                      subtitle: Text(state.authStatus.authData.user.name),
                      dense: false,
                    ),
                    ListTile(
                      title:
                          Text(AppLocalizations.of(context).translate('email')),
                      subtitle: Text(state.authStatus.authData.user.email),
                      dense: false,
                    ),
                    ListTile(
                      title: Text(AppLocalizations.of(context)
                          .translate('account_address')),
                      subtitle: Text(
                          state.authStatus.authData.user.address.toString()),
                      dense: false,
                    ),
                    ListTile(
                      title: Text(AppLocalizations.of(context)
                          .translate('account_phone')),
                      subtitle:
                          Text(state.authStatus.authData.user.phone.toString()),
                      dense: false,
                    ),
                    if (state.authStatus.authData.user is Profesional)
                      ListTile(
                        title:
                            Text(AppLocalizations.of(context).translate('web')),
                        subtitle: Text(
                            (state.authStatus.authData.user as Profesional)
                                .web
                                .toString()),
                        dense: false,
                      ),
                    if (state.authStatus.authData.user is Protectora)
                      ListTile(
                        title:
                            Text(AppLocalizations.of(context).translate('web')),
                        subtitle: Text(
                            (state.authStatus.authData.user as Protectora)
                                .web
                                .toString()),
                        dense: false,
                      ),
                    ListTile(
                      title: Text(
                          AppLocalizations.of(context).translate('password')),
                      subtitle: Text('*****'),
                      dense: false,
                    ),
                    ListTile(
                      title: Text(AppLocalizations.of(context)
                          .translate('account_updated_at')),
                      subtitle: Text(state.authStatus.authData.user.updatedAt
                          .timeago(
                              locale: AppLocalizations.of(context)
                                  .locale
                                  .languageCode)),
                      dense: false,
                    ),
                    ListTile(
                      title: Text(AppLocalizations.of(context)
                          .translate('account_created_at')),
                      subtitle: Text(state.authStatus.authData.user.createdAt
                          .timeago(
                              locale: AppLocalizations.of(context)
                                  .locale
                                  .languageCode)),
                      dense: false,
                    ),
                  ]),
              ListTile(
                trailing: Icon(Icons.edit),
                title: Text(AppLocalizations.of(context)
                    .translate('settings_edit_profile')),
                onTap: () => Navigator.pushNamed(context, '/edit_profile',
                    arguments: state.authStatus.authData.user),
                dense: false,
              ),
              ListTile(
                trailing: Transform.rotate(
                    angle: math.pi, child: Icon(Icons.exit_to_app)),
                title: Text(AppLocalizations.of(context).translate('log_out')),
                onTap: () =>
                    context.bloc<AuthBloc>().add(AuthLogoutRequested()),
                dense: false,
              ),
            ],
          );
        }
        return ListTile(
          onTap: () => Helper.showLoginBottomSheet(context),
          title:
              Text(AppLocalizations.of(context).translate('identify_yourself')),
          subtitle:
              Text(AppLocalizations.of(context).translate('not_signed_in')),
          dense: false,
        );
      },
    );
  }

  Widget _header(String text, context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .subtitle1
            .copyWith(color: Theme.of(context).accentColor),
      ),
    );
  }
}
