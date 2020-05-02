import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String tag;
  Tag({@required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), border: Border.all()),
      child: Text(tag),
    );
  }
}
