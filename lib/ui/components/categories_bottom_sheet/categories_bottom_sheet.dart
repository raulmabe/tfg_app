import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:jumpets_app/models/enums/categories.dart';
import 'package:jumpets_app/ui/components/categories_bottom_sheet/sheet_header.dart';
import 'package:jumpets_app/ui/components/category_button.dart';

class CategoriesBottomSheet extends StatefulWidget {
  @override
  _CategoriesBottomSheetState createState() => _CategoriesBottomSheetState();
}

class _CategoriesBottomSheetState extends State<CategoriesBottomSheet>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  static const double minHeight = 150; //120;

  static const double iconStartSize = 54; //44;
  double get iconEndSize =>
      (MediaQuery.of(context).size.width / numOfElementsOnRow) -
      (iconsHorizontalSpacing * (numOfElementsOnRow - 1));
  static const double iconStartMarginTop = 36;
  static const double iconEndMarginTop = 80;
  static const double iconsVerticalSpacing = 24;
  static const double iconsHorizontalSpacing = 16;

  static const double numOfElementsOnRow = 3;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double lerp(double min, double max) =>
      lerpDouble(min, max, _controller.value);

  double get maxHeight => math.min(
      (iconEndSize * (_getRowOfIndex(Category.values.length) + 1)) +
          (iconsVerticalSpacing *
              (_getRowOfIndex(Category.values.length) + 1)) +
          headerTopMargin,
      MediaQuery.of(context).size.height);

  double get headerTopMargin =>
      lerp(20, 20 + MediaQuery.of(context).padding.top); //<-- Add new property

  double get headerFontSize => lerp(14, 24);

  bool get isOpen => _controller.status == AnimationStatus.completed;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Positioned(
            height: lerp(minHeight, maxHeight),
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onVerticalDragUpdate:
                  _handleDragUpdate, //<-- Add verticalDragUpdate callback
              onVerticalDragEnd: _handleDragEnd,
              onTap: _toggle,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  decoration: BoxDecoration(
                      color: Colors.tealAccent.shade700,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(32))),
                  child: Stack(children: [
                    SingleChildScrollView(
                      physics: isOpen
                          ? BouncingScrollPhysics()
                          : NeverScrollableScrollPhysics(),
                      child: Stack(children: [
                        Container(
                          height: (iconEndSize *
                                  (_getRowOfIndex(Category.values.length) +
                                      1)) +
                              (iconsVerticalSpacing *
                                  (_getRowOfIndex(Category.values.length) +
                                      1)) +
                              headerTopMargin,
                          /* height: maxHeight + ,/*  */ */
                        ),
                        for (Category category in Category.values)
                          _buildCategoryIcon(category),
                      ]),
                    ),
                    SheetHeader(
                      fontSize: headerFontSize,
                      topMargin: headerTopMargin,
                    ),
                  ])),
            ),
          );
        });
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _controller.value -= details.primaryDelta /
        maxHeight; //<-- Update the _controller.value by the movement done by user.
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_controller.isAnimating ||
        _controller.status == AnimationStatus.completed) return;

    final double flingVelocity = details.velocity.pixelsPerSecond.dy /
        maxHeight; //<-- calculate the velocity of the gesture
    if (flingVelocity < 0.0)
      _controller.fling(
          velocity:
              math.max(2.0, -flingVelocity)); //<-- either continue it upwards
    else if (flingVelocity > 0.0)
      _controller.fling(
          velocity:
              math.min(-2.0, -flingVelocity)); //<-- or continue it downwards
    else
      _controller.fling(
          velocity: _controller.value < 0.5
              ? -2.0
              : 2.0); //<-- or just continue to whichever edge is closer
  }

  void _toggle() {
    _controller.fling(velocity: isOpen ? -2 : 2);
  }

  double get iconSize => lerp(iconStartSize, iconEndSize);

  double iconTopMargin(int index) =>
      lerp(
          iconStartMarginTop,
          iconEndMarginTop +
              _getRowOfIndex(index) * (iconsVerticalSpacing + iconEndSize)) +
      headerTopMargin; //<-- calculate top margin based on header margin, and size of all of icons above (from small to big)

  double iconLeftMargin(int index) => lerp(
      index * (iconsHorizontalSpacing + iconStartSize),
      _getPositionInRow(index) * (iconsHorizontalSpacing + iconEndSize));

  Widget _buildCategoryIcon(Category category) {
    int index = Category.values.toList().indexOf(category);
    return Positioned(
        top: iconTopMargin(index),
        left: iconLeftMargin(index),
        height: iconSize,
        width: iconSize,
        child: CategoryButtonBuilder.fromCategory(
          category: category,
          size: iconSize,
          borderRadius: lerp(8, 24),
          isCollapsed: lerp(0, 1) < .7,
        ));
  }

  double _getRowOfIndex(int index) {
    for (int i = 1; i < Category.values.length; ++i) {
      if (index < numOfElementsOnRow * i) return (i - 1).toDouble();
    }
    return index.toDouble();
  }

  double _getPositionInRow(int index) =>
      (index % numOfElementsOnRow).floorToDouble();
}
