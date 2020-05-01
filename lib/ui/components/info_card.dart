import 'package:flutter/material.dart';

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
          border: Border.all(
            color: color ?? Theme.of(context).accentColor,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          title != null
              ? Text(title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: color ?? Theme.of(context).accentColor,
                  ))
              : Container(),
          Text(message,
              style: TextStyle(
                color: color ?? Theme.of(context).accentColor,
              )),
        ],
      ),
    );
  }
}
