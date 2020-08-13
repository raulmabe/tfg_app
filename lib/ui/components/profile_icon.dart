import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  final String url;
  final double radius;
  final bool withBorder;
  final VoidCallback onTap;

  ProfileIcon(
      {@required this.url,
      this.radius = 20.0,
      this.withBorder = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Material(
          shape: CircleBorder(
            side: BorderSide(
                color: Theme.of(context).accentColor,
                width: withBorder ? 2 : 0),
          ),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              url,
            ),
          ),
        ),
      ),
    );
  }
}
