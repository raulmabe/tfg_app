import 'package:flutter/material.dart';

class PhotoIcon extends StatelessWidget {
  final String url;
  final EdgeInsets margin;
  PhotoIcon({@required this.url, this.margin});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(url))),
    );
  }
}
