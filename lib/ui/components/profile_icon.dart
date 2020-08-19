import 'package:flutter/material.dart';
import 'package:jumpets_app/models/models.dart';

class ProfileIcon extends StatelessWidget {
  final User user;
  final double radius;
  final double borderWidth;
  final VoidCallback onTap;
  final bool withBadge;

  ProfileIcon(
      {@required this.user,
      this.radius = 20.0,
      this.borderWidth = 0,
      this.onTap,
      this.withBadge = true});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: InkWell(
            onTap: onTap,
            child: Material(
                shape: CircleBorder(
                  side:
                      BorderSide(color: user.colorFromType, width: borderWidth),
                ),
                child: user.thumbnail != null
                    ? CircleAvatar(
                        radius: radius,
                        backgroundImage: NetworkImage(
                          user.thumbnail,
                        ),
                      )
                    : CircleAvatar(
                        radius: radius,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: ClipOval(
                            child:
                                Image.asset('assets/img/default_avatar.png')),
                      )),
          ),
        ),
      ],
    );
  }
}
