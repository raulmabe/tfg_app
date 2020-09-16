import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jumpets_app/ui/components/animated_gradient_icon.dart';
import 'package:jumpets_app/ui/components/jumpets_icons_icons.dart';

class FloatingBottomBar extends StatelessWidget {
  final double elevation;
  final double mainIconSize;

  final int pageSelected;
  final Function(int) onTap;
  final Function onDoubleMainTap;

  FloatingBottomBar(
      {this.elevation = 10,
      this.mainIconSize = 65,
      @required this.pageSelected,
      @required this.onTap,
      this.onDoubleMainTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Transform.translate(
                  offset: Offset(0, -10),
                  child: SizedBox(
                    height: mainIconSize,
                    width: mainIconSize,
                    child: Material(
                      shape: CircleBorder(),
                      elevation: elevation / 2,
                      color: Colors.redAccent,
                    ),
                  )),
            ),
            SizedBox(
              height: 50,
              child: Material(
                elevation: elevation,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Theme.of(context).primaryColor,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: AnimatedGradientIcon(
                          pageSelected == 0
                              ? Icons.favorite
                              : Icons.favorite_border,
                          isSelected: pageSelected == 0,
                        ),
                        onPressed: () => onTap(0),
                      ),
                      IconButton(
                          icon: Icon(JumpetsIcons.nariz_jumpets),
                          onPressed: null),
                      IconButton(
                        icon: AnimatedGradientIcon(
                          pageSelected == 2
                              ? FontAwesomeIcons.solidComment
                              : FontAwesomeIcons.comment,
                          isSelected: pageSelected == 2,
                        ),
                        onPressed: () => onTap(2),
                      ),
                    ]),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Transform.translate(
                  offset: Offset(0, -10),
                  child: SizedBox(
                    height: mainIconSize,
                    width: mainIconSize,
                    child: Material(
                      color: Theme.of(context).primaryColor,
                      shape: CircleBorder(),
                      child: InkWell(
                        customBorder: CircleBorder(),
                        onTap: () {
                          if (onDoubleMainTap != null && pageSelected == 1)
                            onDoubleMainTap();

                          onTap(1);
                        },
                        child: AnimatedGradientIcon(
                          JumpetsIcons.nariz_jumpets,
                          isSelected: pageSelected == 1,
                          size: mainIconSize / 2.2,
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  final double elevation;
  final double mainIconSize;

  final int pageSelected;
  final Function(int) onTap;
  final Function onDoubleMainTap;

  BottomBar(
      {this.elevation = 10,
      this.mainIconSize = 65,
      @required this.pageSelected,
      @required this.onTap,
      this.onDoubleMainTap});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
      child: BottomAppBar(
        notchMargin: 6,
        elevation: elevation,
        shape: CircularNotchedRectangle(),
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: Container(
            height: kToolbarHeight * 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: AnimatedGradientIcon(
                    pageSelected == 0 ? Icons.favorite : Icons.favorite_border,
                    isSelected: pageSelected == 0,
                  ),
                  onPressed: () => onTap(0),
                ),
                IconButton(
                  icon: AnimatedGradientIcon(
                    pageSelected == 2
                        ? FontAwesomeIcons.solidComment
                        : FontAwesomeIcons.comment,
                    isSelected: pageSelected == 2,
                  ),
                  onPressed: () => onTap(2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
