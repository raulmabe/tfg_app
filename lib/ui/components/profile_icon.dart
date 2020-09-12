import 'dart:math';

import 'package:content_placeholder/content_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:transparent_image/transparent_image.dart';

class CircularProfileThumb extends StatelessWidget {
  final User user;
  final double radius;
  final double borderWidth;
  final VoidCallback onTap;
  final double elevation;

  CircularProfileThumb(
      {@required this.user,
      this.radius = 20.0,
      this.borderWidth = 0,
      this.onTap,
      this.elevation = 0});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: elevation,
        shape: CircleBorder(
          side: BorderSide(color: user.colorFromType, width: borderWidth),
        ),
        child: InkWell(
          onTap: onTap,
          child: user.thumbnail != null
              ? ClipOval(
                  child: Image.network(
                    user.thumbnail,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return FittedBox(
                        child: ContentPlaceholder(
                          borderRadius: 50,
                          height: radius * 2,
                          width: radius * 2,
                        ),
                      );
                    },
                    fit: BoxFit.cover,
                    width: radius * 2,
                    height: radius * 2,
                  ),
                )
              : CircleAvatar(
                  radius: radius,
                  backgroundColor: Theme.of(context).accentColor,
                  child: ClipOval(
                      child: Image.asset('assets/img/default_avatar.png')),
                ),
        ),
      ),
    );
  }
}

class RoundedRectProfileThumb extends StatelessWidget {
  final User user;
  final double width;
  final double height;
  final double borderWidth;
  final double borderRadius;
  final VoidCallback onTap;

  RoundedRectProfileThumb({
    @required this.user,
    this.width = 100.0,
    this.height = 80.0,
    this.borderRadius = 20.0,
    this.borderWidth = 0,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: SizedBox(
        height: height,
        width: width,
        child: Material(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: user.colorFromType, width: borderWidth),
              borderRadius: BorderRadius.circular(borderRadius)),
          child: InkWell(
            onTap: onTap,
            child: user.thumbnail != null
                ? FadeInImage.memoryNetwork(
                    fit: BoxFit.cover,
                    height: height,
                    width: width,
                    placeholder: kTransparentImage,
                    image: user.thumbnail)
                : Image.asset('assets/img/default_avatar.png'),
          ),
        ),
      ),
    );
  }
}
