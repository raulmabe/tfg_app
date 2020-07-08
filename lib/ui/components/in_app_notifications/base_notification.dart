import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class BaseNotification extends StatelessWidget {
  final String title, text, emoji;
  final bool success;

  BaseNotification({this.title, @required this.text, this.emoji, this.success});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: success ? null : Theme.of(context).errorColor,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: SafeArea(
        child: ListTile(
          leading: emoji != null
              ? SizedBox.fromSize(
                  size: const Size(40, 40),
                  child: ClipOval(
                      child: Container(
                    child: Center(
                      child: Text(emoji),
                    ),
                  )))
              : null,
          title: Text(title ?? 'Hey!'),
          subtitle: Text(text),
          trailing: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                OverlaySupportEntry.of(context).dismiss();
              }),
        ),
      ),
    );
  }
}
