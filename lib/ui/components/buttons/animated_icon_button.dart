import 'dart:ui';

import 'package:flutter/material.dart';

class AnimatedIconButton extends ImplicitlyAnimatedWidget {
  final VoidCallback onTap;
  final Widget child;
  final double size;
  final double elevation;
  final List<Color> colors;
  final List<Color> disabledColors;

  AnimatedIconButton(
      {@required this.onTap,
      @required this.child,
      @required this.colors,
      @required this.disabledColors,
      this.size = 52,
      this.elevation = 0})
      : super(duration: Duration(milliseconds: 300));

  @override
  _AnimatedIconStateButton createState() => _AnimatedIconStateButton();
}

class _AnimatedIconStateButton
    extends AnimatedWidgetBaseState<AnimatedIconButton> {
  GradientTween _gradientTween;

  double factor = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: ShaderMask(
            shaderCallback: (bounds) =>
                LinearGradient(colors: _gradientTween.evaluate(animation))
                    .createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: Material(
              elevation: elevation,
              shape: CircleBorder(),
              color: Colors.white,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () async {
                  onTap();

                  // Hacer el icono volar para arriba
                  setState(() {
                    factor = 1;
                  });

                  // Hacer el icono aparecer abajo
                  await Future.delayed(Duration(milliseconds: 250));
                  setState(() {
                    factor = -1;
                  });

                  // Hacer el icono volar para la posicion inicial
                  await Future.delayed(Duration(milliseconds: 250));
                  setState(() {
                    factor = 0;
                  });
                },
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
                child: SizedBox(
                    height: size,
                    width: size,
                    child: ClipOval(
                        child: AnimatedIcon(
                      child: child,
                      offset: targetHeight,
                    ))))),
      ],
    );
  }

  List<Color> get colors => widget.colors;
  double get size => widget.size;
  double get elevation => widget.elevation;
  Widget get child => widget.child;
  Function get onTap => widget.onTap;

  List<Color> targetColors() =>
      widget.onTap == null ? widget.disabledColors : widget.colors;

  double get targetHeight => factor * size;

  @override
  void forEachTween(visitor) {
    _gradientTween = visitor(
        _gradientTween, targetColors(), (value) => GradientTween(begin: value));
  }
}

class AnimatedIcon extends ImplicitlyAnimatedWidget {
  final Widget child;
  final double offset;

  AnimatedIcon({
    @required this.child,
    @required this.offset,
  }) : super(duration: Duration(milliseconds: 400), curve: Curves.easeOutQuad);

  @override
  _AnimatedIconState createState() => _AnimatedIconState();
}

class _AnimatedIconState extends AnimatedWidgetBaseState<AnimatedIcon> {
  FlyTween _flyTween;
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: Offset(0, -_flyTween.evaluate(animation)), child: widget.child);
  }

  @override
  void forEachTween(visitor) {
    _flyTween =
        visitor(_flyTween, widget.offset, (value) => FlyTween(begin: value));
  }
}

class GradientTween extends Tween<List<Color>> {
  GradientTween({List<Color> begin, List<Color> end})
      : super(begin: begin, end: end);

  List<Color> lerp(double t) {
    List<Color> colors = [];

    for (int i = 0; i < begin.length; ++i) {
      colors.add(Color.lerp(begin[i], end[i], t));
    }
    return colors;
  }
}

class FlyTween extends Tween<double> {
  FlyTween({double begin, double end}) : super(begin: begin, end: end);

  double lerp(double t) {
    if (end < 0) {
      return end;
    } else {
      return lerpDouble(begin, end, t);
    }
  }
}
