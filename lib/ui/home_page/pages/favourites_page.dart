import 'package:flutter/material.dart';
import 'package:jumpets_app/ui/components/vertical_grid/vertical_grid.dart';

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        VerticalGrid(
            ads: [],
            widgetInjection:
                Text('Favourites', style: Theme.of(context).textTheme.display2))
      ],
    );
  }
}
