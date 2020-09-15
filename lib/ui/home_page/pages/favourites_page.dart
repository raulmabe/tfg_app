import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/favs_bloc/favourites_bloc.dart';
import 'package:jumpets_app/models/ads/ad.dart';
import 'package:jumpets_app/models/wrappers/auth_status.dart';
import 'package:jumpets_app/ui/components/background_illustrations/empty_space.dart';
import 'package:jumpets_app/ui/components/vertical_grid/vertical_grid.dart';

class FavouritesPage extends StatefulWidget {
  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  FavouritesBloc favBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    favBloc = context.bloc<FavouritesBloc>();

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

        if (ads.isEmpty && state is! FavouritesLoading) {
          return Column(
            children: [
              Spacer(),
              EmptySpace(),
              Spacer(
                flex: 2,
              ),
            ],
          );
        }
        return ListView(
          shrinkWrap: true,
          children: <Widget>[
            (state is FavouritesFailure)
                ? ErrorSpace(retry: state.retry, msg: state.msg)
                : VerticalGrid(
                    usePlaceholders: state is FavouritesLoading,
                    ads: ads,
                  )
          ],
        );
      },
    );
  }
}
