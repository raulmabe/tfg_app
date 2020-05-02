import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SexIcon extends StatelessWidget {
  final bool male;
  final double size;
  SexIcon({@required this.male, this.size = 17});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        male ? FontAwesomeIcons.mars : FontAwesomeIcons.venus,
        size: size,
        color: male ? Theme.of(context).accentColor : Color(0xffFDA7DF),
      ),
    );
  }
}
