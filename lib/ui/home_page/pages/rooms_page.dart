import 'dart:math';

import 'package:content_placeholder/content_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/rooms_bloc/rooms_bloc.dart';
import 'package:jumpets_app/models/chats/room.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/ui/components/background_illustrations/empty_space.dart';
import 'package:jumpets_app/ui/components/placeholders/chat_placeholders.dart';
import 'package:jumpets_app/ui/components/profile_icon.dart';

class RoomsPage extends StatefulWidget {
  @override
  _RoomsPageState createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  RoomsBloc roomsBloc;

  @override
  void initState() {
    super.initState();

    roomsBloc = context.bloc<RoomsBloc>();

    if (!(roomsBloc.state is RoomsSuccess)) {
      roomsBloc.add(RoomsFetched());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: BlocBuilder<RoomsBloc, RoomsState>(
        builder: (context, state) {
          List<Widget> children = [];

          if (state is RoomsSuccess) {
            children = state.rooms
                .map((room) => Column(
                      children: [
                        ListTile(
                          onTap: () => Navigator.pushNamed(context, '/chat',
                              arguments: room),
                          leading: SizedBox(
                            height: 60,
                            width: 60,
                            child: FittedBox(
                              child: CircularProfileThumb(
                                  user: otherUser(context, room)),
                            ),
                          ),
                          title: Row(
                            children: [
                              Flexible(
                                child: Text('${otherUser(context, room).name}',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(
                                  otherUser(context, room).iconFromType,
                                  size: 18,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .color,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Text('${room.messages.last.text}',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(fontSize: 14)),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                  '${room.messages.last.createdAt.toLocal().format('h:mm a', AppLocalizations.of(context).locale.toString())}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(fontSize: 14)),
                            ],
                          ),
                        ),
                        Divider(
                          indent: MediaQuery.of(context).size.width * .2,
                        ),
                      ],
                    ))
                .toList();
          }

          if (state is RoomsLoading) {
            children = List.generate(6, (index) => ChatTilePlaceholder());
          }

          if (children.isEmpty) {
            return Column(
              children: [
                Spacer(),
                ErrorSpace(
                    retry: state is RoomsFailure ? state.retry : null,
                    msg: state is RoomsFailure ? state.msg : null),
                Spacer(
                  flex: 2,
                ),
              ],
            );
          }

          return ListView(
            shrinkWrap: true,
            children: <Widget>[
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

  User otherUser(BuildContext context, Room room) =>
      (context.bloc<AuthBloc>().state.authStatus.authData?.user?.id ?? false) ==
              room.user1.id
          ? room.user2
          : room.user1;
}
