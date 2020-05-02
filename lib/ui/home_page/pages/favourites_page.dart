import 'package:flutter/material.dart';
import 'package:jumpets_app/ui/components/vertical_grid/vertical_grid.dart';
import 'package:jumpets_app/ui/home_page/pages/favourites_page_vm.dart';

class FavouritesPage extends StatelessWidget {
  final FavouritesPageViewModel viewModel;
  FavouritesPage({this.viewModel});
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
