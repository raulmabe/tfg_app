import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/rooms_bloc/rooms_bloc.dart';
import 'package:jumpets_app/models/chats/room.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/ui/components/background_illustrations/empty_space.dart';
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
    return BlocBuilder<RoomsBloc, RoomsState>(
      builder: (context, state) {
        List<Widget> children = [];

        if (state is RoomsSuccess) {
          children = state.rooms
              .map((room) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ListTile(
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
                      title: Text('${otherUser(context, room).name}',
                          style: Theme.of(context).textTheme.bodyText2),
                      subtitle: Text('${room.messages.last.text}',
                          style: Theme.of(context).textTheme.bodyText1),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(
                              otherUser(context, room).iconFromType,
                              size: 20,
                            ),
                          ),
                          Text(
                              '${room.messages.last.createdAt.toLocal().format('h:mm a', AppLocalizations.of(context).locale.toString())}'),
                        ],
                      ),
                    ),
                  ))
              .toList();
        }

        return ListView(
          shrinkWrap: true,
          children: <Widget>[
            _title(context, children.length),
            (state is RoomsFailure)
                ? EmptySpace()
                : Column(
                    children: children,
                  ),
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
              child: Text(AppLocalizations.of(context).translate('chats'),
                  style: Theme.of(context).textTheme.headline3),
            ),
            Text(length.toString(),
                style: Theme.of(context).textTheme.headline5),
          ],
        ),
      );

  User otherUser(BuildContext context, Room room) =>
      (context.bloc<AuthBloc>().state.authStatus.authData?.user?.id ?? false) ==
              room.user1.id
          ? room.user2
          : room.user1;
}
