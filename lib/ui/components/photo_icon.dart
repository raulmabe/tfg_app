import 'package:flutter/material.dart';

class PhotoIcon extends StatelessWidget {
  final String url;
  final EdgeInsets margin;
  final double borderWidth;
  PhotoIcon({@required this.url, this.margin, this.borderWidth = 0});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).accentColor, width: borderWidth),
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(url))),
    );
  }
}
