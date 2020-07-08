import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(32)),
      child: Row(children: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.grey.shade800,
          ),
          onPressed: () => print('search'),
        ),
        Expanded(
          child: TextField(
              decoration: InputDecoration.collapsed(
                  hintText: 'What are you looking for')),
        ),
      ]),
    );
  }
}
