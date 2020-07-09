import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:tinycolor/tinycolor.dart';

class BaseNotification extends StatelessWidget {
  final String title, text;
  final IconData icon;
  final bool success;

  BaseNotification({this.title, @required this.text, this.success, this.icon});

  @override
  Widget build(BuildContext context) {
    TinyColor bgColor =
        TinyColor(success ? Colors.white : Theme.of(context).errorColor);

    return SafeArea(
      child: Card(
        elevation: 7,
        color: bgColor.color,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: ListTile(
            leading: chooseAvatar(context),
            title: title != null
                ? Text(title,
                    style:
                        Theme.of(context).primaryTextTheme.subtitle1.copyWith(
                              color: Colors.black87,
                            ))
                : null,
            subtitle: Text(text,
                style: Theme.of(context).primaryTextTheme.subtitle1.copyWith(
                      color: Colors.black54,
                    )),
            trailing: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  OverlaySupportEntry.of(context).dismiss();
                }),
          ),
        ),
      ),
    );
  }

  Widget chooseAvatar(context) {
    return Icon(
        success ? FontAwesomeIcons.check : FontAwesomeIcons.exclamation);
  }
}
