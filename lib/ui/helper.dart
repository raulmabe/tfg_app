import 'package:flutter/material.dart';
import 'package:jumpets_app/models/enums/user_types.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/ui/components/auth/auth_sheet.dart';

class Helper {
  static void showLoginBottomSheet(BuildContext context) {
    showModalBottomSheet(
        barrierColor: Colors.black26,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        )),
        isScrollControlled: true,
        context: context,
        builder: (_) => Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: AuthSheet()));
  }

  static Color getUserColorByType(UserType type) {
    var dummyUser;
    switch (type) {
      case UserType.PROTECTORA:
        dummyUser = Protectora((b) => b
          ..thumbnail = ''
          ..address = ''
          ..createdAt = DateTime.now()
          ..updatedAt = DateTime.now()
          ..id = ''
          ..email = ''
          ..phone = 5
          ..name = '');
        return (dummyUser as Protectora).colorFromType;
      case UserType.PROFESIONAL:
        dummyUser = Profesional((b) => b
          ..thumbnail = ''
          ..address = ''
          ..createdAt = DateTime.now()
          ..updatedAt = DateTime.now()
          ..id = ''
          ..email = ''
          ..phone = 5
          ..name = '');
        return (dummyUser as Profesional).colorFromType;
      case UserType.PROTECTORA:
      default:
        dummyUser = Particular((b) => b
          ..thumbnail = ''
          ..address = ''
          ..createdAt = DateTime.now()
          ..updatedAt = DateTime.now()
          ..id = ''
          ..email = ''
          ..phone = 5
          ..name = '');
        return (dummyUser as Particular).colorFromType;
    }
  }
}
