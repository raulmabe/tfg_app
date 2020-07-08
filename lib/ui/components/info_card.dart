import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

class InfoCard extends StatelessWidget {
  final String title, message;
  final Color color;
  InfoCard({@required this.message, this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                TinyColor(color ?? Theme.of(context).primaryColorDark)
                    .lighten(0)
                    .color,
                TinyColor(color ?? Theme.of(context).primaryColorDark)
                    .darken(10)
                    .color
              ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          title != null
              ? Text(title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                        Colors.white, // color ?? Theme.of(context).accentColor,
                  ))
              : Container(),
          Text(message,
              style: TextStyle(
                color: Colors.white, //color ?? Theme.of(context).accentColor,
              )),
        ],
      ),
    );
  }
}
