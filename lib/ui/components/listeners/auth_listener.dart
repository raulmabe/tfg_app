import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/favs_bloc/favourites_bloc.dart';
import 'package:jumpets_app/blocs/rooms_bloc/rooms_bloc.dart';
import 'package:jumpets_app/models/wrappers/auth_status.dart';

class AuthListener extends StatelessWidget {
  final Widget child;
  AuthListener({this.child});
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          previous.authStatus.status != AuthenticationStatus.authenticated &&
          current.authStatus.status == AuthenticationStatus.authenticated,
      listener: (context, state) {
        context.bloc<FavouritesBloc>().add(FavouritesFetched());
        context.bloc<RoomsBloc>().add(RoomsFetched());
      },
      child: BlocListener<AuthBloc, AuthState>(
          listenWhen: (previous, current) =>
              previous.authStatus.status ==
                  AuthenticationStatus.authenticated &&
              current.authStatus.status != AuthenticationStatus.authenticated,
          listener: (context, state) {
            context.bloc<FavouritesBloc>().add(FavouriteInitialized());
            context.bloc<RoomsBloc>().add(RoomsInitialized());
          },
          child: child),
    );
  }
}
