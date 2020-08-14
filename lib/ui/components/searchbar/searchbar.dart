import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
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
              controller: controller,
              decoration: InputDecoration.collapsed(
                  hintText: 'What are you looking for')),
        ),
        controller.value.text.length > 0
            ? IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.grey.shade800,
                ),
                onPressed: () => controller.clear(),
              )
            : Container(),
      ]),
    );
  }
}
