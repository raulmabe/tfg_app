import 'package:flutter/material.dart';
import 'package:jumpets_app/app_localizations.dart';

import 'package:jumpets_app/models/models.dart';

class UserChip extends StatelessWidget {
  final User user;
  final bool small;
  final String tag;
  UserChip({@required this.tag, @required this.user, this.small = false})
      : assert(user != null),
        assert(tag != null);

  @override
  Widget build(BuildContext context) {
    if (user.isParticular) {
      return Container();
    }

    double factor = small ? 0.7 : 1.0;

    return Padding(
        padding: EdgeInsets.all(8.0 * factor),
        child: Hero(
          tag: tag,
          child: Material(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: EdgeInsets.all(8.0 * factor),
              child: Row(children: _content(context, factor)),
            ),
          ),
        ));
  }

  List<Widget> _content(context, factor) {
    String text = AppLocalizations.of(context).translate(user.stringFromType);

    return <Widget>[
      Icon(
        user.iconFromType,
        size: 20 * factor,
        color: Theme.of(context).accentColor,
      ),
      SizedBox(
        width: 10 * factor,
      ),
      FittedBox(
        child: Text(small ? text.substring(0, 4) : text),
      ),
    ];
  }
}
