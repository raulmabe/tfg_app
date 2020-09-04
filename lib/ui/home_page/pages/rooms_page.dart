import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:jumpets_app/blocs/favs_bloc/favourites_bloc.dart';
import 'package:jumpets_app/blocs/rooms_bloc/rooms_bloc.dart';
import 'package:jumpets_app/data/repositories/user_repository.dart';
import 'package:jumpets_app/models/ads/ad.dart';
import 'package:jumpets_app/models/wrappers/auth_status.dart';
import 'package:jumpets_app/ui/components/background_illustrations/empty_space.dart';
import 'package:jumpets_app/ui/components/vertical_grid/vertical_grid.dart';

class RoomsPage extends StatefulWidget {
  @override
  _RoomsPageState createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  RoomsBloc roomsBloc;

  @override
  void initState() {
    super.initState();

    roomsBloc = RoomsBloc(
        repository: RepositoryProvider.of<UserRepository>(context),
        authBloc: context.bloc<AuthBloc>(),
        errorBloc: context.bloc<ErrorHandlerBloc>())
      ..add(RoomsFetched());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RoomsBloc>(
      create: (context) => roomsBloc,
      child: BlocBuilder<RoomsBloc, RoomsState>(
        builder: (context, state) {
          List<Widget> children = [];

          if (state is RoomsSuccess) {
            children = state.rooms
                .map((room) => ListTile(
                      title: Text('${room.user1.name} - ${room.user2.name}'),
                    ))
                .toList();
          }

          return ListView(
            shrinkWrap: true,
            children: <Widget>[
              _title(context, 0),
              (state is RoomsFailure)
                  ? EmptySpace()
                  : Column(
                      children: children,
                    ),
            ],
          );
        },
      ),
    );
  }

  Widget _title(context, length) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(AppLocalizations.of(context).translate('chats'),
                  style: Theme.of(context).textTheme.headline3),
            ),
            Text(length.toString(),
                style: Theme.of(context).textTheme.headline5),
          ],
        ),
      );
}
