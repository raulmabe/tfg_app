import 'package:content_placeholder/content_placeholder.dart';
import 'package:flutter/material.dart';

class ChatTilePlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Row(children: [
        ContentPlaceholder(
          borderRadius: 50,
          height: 50,
          width: 50,
        ),
        SizedBox(
          width: 35,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContentPlaceholder(
              borderRadius: 10,
              height: 17,
              width: MediaQuery.of(context).size.width * .3,
            ),
            SizedBox(
              width: 20,
            ),
            ContentPlaceholder(
              borderRadius: 10,
              height: 15,
              width: MediaQuery.of(context).size.width * .2,
            ),
          ],
        ),
        Spacer(),
        Column(
          children: [
            ContentPlaceholder(
              borderRadius: 10,
              height: 17,
              width: MediaQuery.of(context).size.width * .1,
            ),
            Spacer()
          ],
        )
      ]),
    );
  }
}
