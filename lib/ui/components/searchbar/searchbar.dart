import 'package:flutter/material.dart';
import 'package:jumpets_app/app_localizations.dart';

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
                  hintText: AppLocalizations.of(context)
                      .translate('search_bar_hint_text'))),
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
