import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:jumpets_app/blocs/message_bloc/message_bloc.dart';
import 'package:jumpets_app/blocs/rooms_bloc/rooms_bloc.dart';
import 'package:jumpets_app/data/repositories/user_repository.dart';
import 'package:jumpets_app/models/chats/message.dart';
import 'package:jumpets_app/models/chats/room.dart';
import 'package:jumpets_app/models/models.dart';

class ChatPage extends StatelessWidget {
  final Room room;
  ChatPage({@required this.room});

  final ValueNotifier<String> _textChanged = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MessageBloc>(
        create: (context) => MessageBloc(
            repository: RepositoryProvider.of<UserRepository>(context),
            authBloc: context.bloc<AuthBloc>(),
            errorBloc: context.bloc<ErrorHandlerBloc>()),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            title: Text(
              '${room.user1.name} - ${room.user2.name}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              BlocBuilder<MessageBloc, MessageState>(
                buildWhen: (previous, current) => current is MessageSuccess,
                builder: (context, state) {
                  // maybe sort messages

                  List<Message> messages = room.messages.toList();

                  if (state is MessageSuccess) {
                    messages = state.room.messages.toList();
                  }

                  return ListView(
                      reverse: true,
                      shrinkWrap: true,
                      children: <Widget>[
                        SizedBox(
                          height: kToolbarHeight,
                        )
                      ]..addAll(messages.reversed
                          .map((message) => Container(
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color:
                                      message.sender.id == otherUser(context).id
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(message.text)))
                          .toList()));
                },
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Material(
                    color: Theme.of(context).primaryColor,
                    child: SafeArea(
                      child: SizedBox(
                        height: kToolbarHeight,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  _textChanged.value = value;
                                },
                              ),
                            ),
                            ValueListenableBuilder<String>(
                                valueListenable: _textChanged,
                                builder: (context, value, child) {
                                  Function onTap;

                                  if (value != null &&
                                      value.trim().isNotEmpty) {
                                    onTap = () => context
                                        .bloc<MessageBloc>()
                                        .add(MessageSent(
                                            text: value,
                                            toUserId: otherUser(context).id));
                                  }

                                  return IconButton(
                                      icon: Icon(Icons.send), onPressed: onTap);
                                })
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ));
  }

  User otherUser(BuildContext context) =>
      (context.bloc<AuthBloc>().state.authStatus.authData?.user?.id ?? false) ==
              room.user1.id
          ? room.user2
          : room.user1;
}
