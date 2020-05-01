import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Material(
        shape: CircleBorder(
          side: BorderSide(color: Theme.of(context).accentColor, width: 2),
        ),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            'https://pbs.twimg.com/profile_images/977547096244047872/6x1ugfRC_400x400.jpg',
          ),
        ),
      ),
    ]);
  }
}
