import 'package:flutter/material.dart';

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
          ListTile(
            title: Text('Email'),
            subtitle: Text('swswsws'),
            dense: true,
          ),
          ListTile(
            title: Text('Password'),
            subtitle: Text('swswswsw'),
            dense: true,
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
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
    );
  }
}
