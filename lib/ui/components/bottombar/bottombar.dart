import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                        icon: Icon(
                          pageSelected == 0
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: pageSelected == 0
                              ? Theme.of(context).accentColor
                              : Colors.grey.shade500,
                        ),
                        onPressed: () => onTap(0),
                      ),
                      IconButton(
                          icon: Icon(JumpetsIcons.nariz_jumpets),
                          onPressed: null),
                      IconButton(
                        icon: Icon(
                          pageSelected == 2
                              ? FontAwesomeIcons.solidComment
                              : FontAwesomeIcons.comment,
                          color: pageSelected == 2
                              ? Theme.of(context).accentColor
                              : Colors.grey.shade500,
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
                        child: Icon(
                          JumpetsIcons.nariz_jumpets,
                          color: pageSelected == 1
                              ? Theme.of(context).accentColor
                              : Colors.grey.shade500,
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
    return Material(
      child: SafeArea(
        child: SizedBox(
          height: kToolbarHeight * .8,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
              icon: Icon(
                pageSelected == 0 ? Icons.favorite : Icons.favorite_border,
                color: pageSelected == 0
                    ? Theme.of(context).accentColor
                    : Colors.grey.shade500,
              ),
              onPressed: () => onTap(0),
            ),
            IconButton(
              icon: Icon(
                JumpetsIcons.nariz_jumpets,
                color: pageSelected == 1
                    ? Theme.of(context).accentColor
                    : Colors.grey.shade500,
              ),
              onPressed: () {
                if (onDoubleMainTap != null && pageSelected == 1)
                  onDoubleMainTap();

                onTap(1);
              },
            ),
            IconButton(
              icon: Icon(
                pageSelected == 2
                    ? FontAwesomeIcons.solidComment
                    : FontAwesomeIcons.comment,
                color: pageSelected == 2
                    ? Theme.of(context).accentColor
                    : Colors.grey.shade500,
              ),
              onPressed: () => onTap(2),
            ),
          ]),
        ),
      ),
    );
  }
}
