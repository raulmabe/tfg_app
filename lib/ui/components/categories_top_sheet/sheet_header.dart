import 'package:flutter/material.dart';

class SheetHeaderTop extends StatelessWidget {
  final double fontSize;
  final double topMargin;

  const SheetHeaderTop(
      {Key key, @required this.fontSize, @required this.topMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(top: topMargin),
        /* color: Colors.redAccent, */
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Text(
                'What are you looking for?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            IconButton(
                icon: Icon(Icons.search, color: Colors.white), onPressed: () {})
          ],
        ),
      ),
    );
  }
}
