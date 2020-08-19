import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/favs_bloc/favourites_bloc.dart';
import 'package:jumpets_app/models/ads/ad.dart';
import 'package:jumpets_app/ui/components/vertical_grid/vertical_grid.dart';

class FavouritesPage extends StatefulWidget {
  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final favBloc = BlocProvider.of<FavouritesBloc>(context);

    if (!(favBloc.state is FavouritesSuccess)) {
      favBloc.add(FavouritesFetched());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesBloc, FavouritesState>(
      builder: (context, state) {
        List<Ad> ads = [];

        if (state is FavouritesSuccess) {
          ads = state.ads;
        }

        return ListView(
          shrinkWrap: true,
          children: <Widget>[
            _title(context, ads.length),
            (state is FavouritesFailure)
                ? FittedBox(
                    child: Text('Error'),
                  )
                : VerticalGrid(
                    usePlaceholders: state is FavouritesLoading,
                    ads: ads,
                  )
          ],
        );
      },
    );
  }

  Widget _title(context, length) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(AppLocalizations.of(context).translate('favourites'),
                  style: Theme.of(context).textTheme.headline3),
            ),
            Text(length.toString()),
          ],
        ),
      );
}
