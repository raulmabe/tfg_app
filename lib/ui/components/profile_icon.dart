import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  final String url;
  final double radius;
  final bool withBorder;

  ProfileIcon(
      {@required this.url, this.radius = 20.0, this.withBorder = false});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Material(
        shape: CircleBorder(
          side: BorderSide(
              color: Theme.of(context).accentColor, width: withBorder ? 2 : 0),
        ),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            url,
          ),
        ),
      ),
    ]);
  }
}
