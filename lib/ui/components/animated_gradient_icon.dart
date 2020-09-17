import 'dart:ui';

import 'package:flutter/material.dart';

import '../app_theme.dart';

class MaterialGradient extends ImplicitlyAnimatedWidget {
  final Widget child;
  final ShapeBorder shape;
  final double elevation;
  final bool isColored;

  final List<Color> onColors;
  final List<Color> offColors;

  List<Color> get targetColors => !isColored
      ? offColors ?? [Colors.white, Colors.white]
      : onColors ?? [AppTheme.kAccentColor, AppTheme.kFourthColor];

  MaterialGradient(
      {this.child,
      this.offColors,
      this.onColors,
      this.elevation,
      this.isColored,
      this.shape})
      : super(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  @override
  _MaterialGradientState createState() => _MaterialGradientState();
}

class _MaterialGradientState extends AnimatedWidgetBaseState<MaterialGradient> {
  GradientTween _gradientTween;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (bounds) =>
              LinearGradient(colors: _gradientTween.evaluate(animation))
                  .createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: Material(
            elevation: widget.elevation,
            shape: widget.shape,
            child: widget.child,
            color: Colors.white,
          ),
        ),
        widget.child,
      ],
    );
  }

  @override
  void forEachTween(visitor) {
    _gradientTween = visitor(_gradientTween, widget.targetColors,
        (value) => GradientTween(begin: value));
  }
}

class AnimatedGradientIcon extends ImplicitlyAnimatedWidget {
  final IconData icon;
  final double size;
  final bool isSelected;

  final List<Color> offColors;
  final List<Color> onColors;
  List<Color> get targetColors => !isSelected
      ? offColors ?? [Colors.grey.shade500, Colors.grey.shade500]
      : onColors ?? [AppTheme.kAccentColor, AppTheme.kFourthColor];

  AnimatedGradientIcon(this.icon,
      {@required this.isSelected,
      this.size = 24.0,
      this.offColors,
      this.onColors})
      : super(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  @override
  _AnimatedGradientIconState createState() => _AnimatedGradientIconState();
}

class _AnimatedGradientIconState
    extends AnimatedWidgetBaseState<AnimatedGradientIcon> {
  GradientTween _gradientTween;
  BigBangTween _doubleTween;
  BigBangTween _backgroundSizeTween;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) =>
          LinearGradient(colors: _gradientTween.evaluate(animation))
              .createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Icon(
        widget.icon,
        color: Colors.white,
        size:
            widget.isSelected ? _doubleTween.evaluate(animation) : widget.size,
      ),
    );
  }

  @override
  void forEachTween(visitor) {
    _gradientTween = visitor(_gradientTween, widget.targetColors,
        (value) => GradientTween(begin: value));

    _doubleTween = visitor(
        _doubleTween, widget.size, (value) => BigBangTween(begin: value));

    _backgroundSizeTween = visitor(_backgroundSizeTween, widget.size + 5.0,
        (value) => BigBangTween(begin: value));
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

class BigBangTween extends Tween<double> {
  BigBangTween({double begin, double end}) : super(begin: begin, end: end);

  double lerp(double t) {
    if (t < .5) {
      return lerpDouble(begin, begin * 1.3, t * 2);
    } else {
      return lerpDouble(begin * 1.3, end, (t - .5) * 2);
    }
  }
}
