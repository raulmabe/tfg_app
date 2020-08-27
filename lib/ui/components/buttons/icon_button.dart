import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final Color color;
  final double size;
  MyIconButton({this.onTap, this.child, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
        child: Material(
      color: color,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: size ?? 52,
          width: size ?? 52,
          child: child,
        ),
      ),
    ));
  }
}
