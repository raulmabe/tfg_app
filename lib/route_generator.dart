import 'package:flutter/material.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/ui/ad_page/ad_page.dart';
import 'package:jumpets_app/ui/home_page/home_page.dart';
import 'package:jumpets_app/ui/profile_page/profile_page.dart';
import 'package:jumpets_app/ui/settings_page/settings_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/ad':
        if (!(args is Ad)) return _errorRoute();
        return MaterialPageRoute(
            builder: (_) => AdPage(
                  ad: args,
                ));
      case '/profile':
        if (!(args is User)) return _errorRoute();
        return MaterialPageRoute(
            builder: (_) => ProfilePage(
                  user: args,
                ));
      case '/settings':
        return MaterialPageRoute(builder: (_) => SettingsPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text(AppLocalizations.of(context)
                    .translate('page_not_found_title')),
              ),
              body: Center(
                child: Text(AppLocalizations.of(context)
                    .translate('page_not_found_msg')),
              ),
            ));
  }
}
