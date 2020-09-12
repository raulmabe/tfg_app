import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jumpets_app/ui/components/cards/animated_minishelter_card.dart';

class PageIndicator extends ImplicitlyAnimatedWidget {
  final int selectedIndex;
  final int length;
  final Color unselectedColor;
  final Color selectedColor;

  PageIndicator(
      {@required this.selectedIndex,
      this.length = 0,
      this.selectedColor = Colors.white,
      this.unselectedColor = Colors.grey,
      Curve curve,
      Duration duration})
      : super(
            duration: duration ?? Duration(milliseconds: 350),
            curve: curve ?? Curves.easeInOut);
  @override
  _PageIndicatorState createState() => _PageIndicatorState();
}

class _PageIndicatorState extends AnimatedWidgetBaseState<PageIndicator> {
  List<DoubleTween> _doubleTweens;

  List<ColorTween> _colorTweens;

  @override
  void initState() {
    super.initState();
    _doubleTweens = List(widget.length);
    _colorTweens = List(widget.length);
  }

  double get size => 10;
  int get selectedSizeFactor => 2;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: List.generate(
            widget.length,
            (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    color: _colorTweens[index]?.evaluate(animation) ??
                        (index == widget.selectedIndex
                            ? widget.selectedColor
                            : widget.unselectedColor),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: SizedBox(
                        height: size,
                        width: _doubleTweens[index]?.evaluate(animation) ??
                            (index == widget.selectedIndex
                                ? size * selectedSizeFactor
                                : size)),
                  ),
                )));
  }

  @override
  void forEachTween(visitor) {
    _doubleTweens?.asMap()?.forEach((index, _doubleTween) {
      _doubleTweens[index] = visitor(
          _doubleTween,
          widget.selectedIndex == index ? size * selectedSizeFactor : size,
          (value) => DoubleTween(begin: value));
    });

    _colorTweens?.asMap()?.forEach((index, _colorTween) {
      _colorTweens[index] = visitor(
          _colorTween,
          widget.selectedIndex == index
              ? widget.selectedColor
              : widget.unselectedColor,
          (value) => ColorTween(begin: value));
    });
  }
}
