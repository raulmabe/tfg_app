import 'package:flutter/material.dart';

class MyFlatButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  MyFlatButton({this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      color: Colors.transparent,
      child: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: child,
          )),
    );
  }
}
