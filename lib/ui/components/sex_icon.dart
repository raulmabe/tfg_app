import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jumpets_app/ui/helper.dart';

class SexIcon extends StatelessWidget {
  final bool male;
  final double size;
  final EdgeInsets padding;
  SexIcon(
      {@required this.male,
      this.size = 17,
      this.padding = const EdgeInsets.all(8.0)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Icon(
        male ? FontAwesomeIcons.mars : FontAwesomeIcons.venus,
        size: size,
        color: Helper.getGenderColor(context, male),
      ),
    );
  }
}
