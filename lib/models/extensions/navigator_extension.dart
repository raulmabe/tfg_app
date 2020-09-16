import 'package:flutter/material.dart';

extension NavigatorStateExtension on NavigatorState {
  bool isCurrent(String routeName) {
    bool isCurrent = false;
    this.popUntil((route) {
      print(route.toString());
      print('Name: ${route.settings.name} == $routeName');
      print(route.settings.arguments);
      if (route.settings.name == routeName) {
        isCurrent = true;
      }
      return true;
    });
    return isCurrent;
  }
}
