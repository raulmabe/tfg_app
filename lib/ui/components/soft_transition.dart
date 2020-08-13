import 'package:flutter/material.dart';

class SoftTransition extends PageRouteBuilder {
  final Widget widget;
  SoftTransition({this.widget})
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return widget;
        }, transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return new FadeTransition(
            opacity: new Tween<double>(
              begin: 0,
              end: 1,
            ).animate(animation),
            child: child,
          );
        });
}
