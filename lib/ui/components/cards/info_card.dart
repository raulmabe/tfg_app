import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

class InfoCard extends StatelessWidget {
  final String title, message;
  final Color color;
  final bool big;
  InfoCard({@required this.message, this.title, this.color, this.big = true});

  @override
  Widget build(BuildContext context) {
    TinyColor tinycolor =
        TinyColor(color ?? Theme.of(context).primaryColorDark);

    return Material(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            /* color: tinycolor.color, */
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  tinycolor.darken(5).color,
                  tinycolor.lighten(5).color,
                ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            title != null
                ? Text(title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white))
                : Container(),
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 5, left: 5),
              child: Text(message,
                  style: TextStyle(
                      color: Colors
                          .white //Colors.white, //color ?? Theme.of(context).accentColor,
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
