import 'package:flutter/material.dart';
import 'package:jumpets_app/models/enums/categories.dart';
import 'package:jumpets_app/models/extensions/categories_extension.dart';

import 'dart:async';

class CategoryButton extends StatelessWidget {
  CategoryButton.fromCategory(
      {@required this.category,
      this.isSelected = false,
      this.onTriggered,
      this.size = 120,
      this.borderRadius = 25,
      this.isCollapsed = false,
      this.onTap});

  final Category category;

  final bool isCollapsed;
  final bool isSelected;

  final double size;
  final double borderRadius;

  final Function(Category) onTap;
  final Function onTriggered;

  CategoryButton(
      {@required this.category,
      @required this.onTap,
      @required this.isSelected,
      @required this.onTriggered,
      @required this.size,
      @required this.borderRadius,
      @required this.isCollapsed});

  @override
  Widget build(BuildContext context) {
    return RoundedSquareButton(
      onTriggered: onTriggered,
      size: size,
      isSelected: isSelected,
      borderRadius: borderRadius,
      onTap: () => onTap(category),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Icon(
                category.getIcon(),
                color:
                    !isSelected ? Theme.of(context).accentColor : Colors.white,
                size: size / 2,
              )),
          !isCollapsed
              ? Expanded(flex: 1, child: Center(child: Text(category.name)))
              : Container()
        ],
      ),
    );
  }
}

class RoundedSquareButton extends StatelessWidget {
  final double size;
  final double borderRadius;
  final Widget child;
  final Function onTap;
  final Function onTriggered;
  final bool isSelected;
  RoundedSquareButton({
    @required this.child,
    @required this.onTap,
    @required this.isSelected,
    this.onTriggered,
    this.size = 120,
    this.borderRadius = 25,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
        color: isSelected ? Theme.of(context).accentColor : Colors.white,
        elevation: 2,
        child: InkWell(
            onTap: () {
              if (onTriggered != null) onTriggered();
              onTap();
            },
            borderRadius: BorderRadius.circular(borderRadius),
            child: child),
      ),
    );
  }
}
