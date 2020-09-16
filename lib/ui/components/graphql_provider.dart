import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:jumpets_app/blocs/info_handler_bloc/info_handler_bloc.dart';
import 'package:jumpets_app/blocs/message_bloc/message_bloc.dart';
import 'package:jumpets_app/blocs/rooms_bloc/rooms_bloc.dart';
import 'package:jumpets_app/data/repositories/user_repository.dart';

class MyGraphQLProvider extends StatelessWidget {
  final Widget child;
  MyGraphQLProvider({this.child});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MessageBloc>(
      create: (context) => MessageBloc(
          roomsBloc: context.bloc<RoomsBloc>(),
          repository: RepositoryProvider.of<UserRepository>(context),
          authBloc: context.bloc<AuthBloc>(),
          errorBloc: context.bloc<ErrorHandlerBloc>(),
          infoBloc: context.bloc<InfoHandlerBloc>()),
      child: Builder(
        builder: (context) {
          return BlocListener<RoomsBloc, RoomsState>(
            listenWhen: (previous, current) => current is RoomsSuccess,
            listener: (context, state) {
              if (state is RoomsSuccess) {
                context.bloc<MessageBloc>().add(RoomsUpdated(
                    roomsIds: state.rooms.map((e) => e.id).toList()));
              }
            },
            child: child,
          );
        },
      ),
    );
  }
}
