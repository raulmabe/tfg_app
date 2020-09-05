import 'package:flutter/material.dart';

class GradientIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final double size;
  final double elevation;
  final List<Color> colors;
  GradientIconButton(
      {@required this.onTap,
      @required this.child,
      @required this.colors,
      this.size = 52,
      this.elevation = 0});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: ShaderMask(
            shaderCallback: (bounds) =>
                LinearGradient(colors: _colors).createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: Material(
              elevation: elevation,
              shape: CircleBorder(),
              color: Colors.white,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: onTap,
                child: SizedBox(
                  height: size,
                  width: size,
                ),
              ),
            ),
          ),
        ),
        Align(
            alignment: Alignment.center,
            child: IgnorePointer(
                child: SizedBox(height: size, width: size, child: child))),
      ],
    );
  }

  List<Color> get _colors =>
      onTap == null ? [Colors.grey.shade400, Colors.grey.shade400] : colors;
}
