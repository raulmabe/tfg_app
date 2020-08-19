import 'package:flutter/material.dart';

class InfoSquare extends StatelessWidget {
  final String title, value;

  InfoSquare({@required this.title, @required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(8),
      height: 75,
      width: 75,
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(10)),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        FittedBox(
          child: Text(title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Theme.of(context).accentColor)),
        ),
        Text(value, textAlign: TextAlign.center),
      ]),
    );
  }
}
