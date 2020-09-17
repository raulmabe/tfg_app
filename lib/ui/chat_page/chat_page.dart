import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/message_bloc/message_bloc.dart';
import 'package:jumpets_app/blocs/rooms_bloc/rooms_bloc.dart';
import 'package:jumpets_app/models/chats/message.dart';
import 'package:jumpets_app/models/chats/room.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/ui/app_theme.dart';
import 'package:jumpets_app/ui/components/buttons/animated_icon_button.dart';

import 'package:jumpets_app/ui/components/chat_bubbles.dart';
import 'package:jumpets_app/ui/components/profile_icon.dart';
import 'dart:math' as math;

class ChatPage extends StatefulWidget {
  final Room room;
  ChatPage({@required this.room});
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Message> _messages;

  @override
  void initState() {
    super.initState();

    _messages = widget.room.messages.toList();
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent;
  }

  Widget get _buildContent {
    return BlocListener<RoomsBloc, RoomsState>(
        listenWhen: (previous, current) {
          Room room;
          if (current is RoomsSuccess) {
            room = current.rooms.firstWhere((aux) => aux.id == widget.room.id,
                orElse: () => null);
          }

          return room != null && room != widget.room;
        },
        listener: (context, state) {
          if (state is RoomsSuccess) {
            Room room = state.rooms.firstWhere(
                (aux) => aux.id == widget.room.id,
                orElse: () => null);

            if (room != null &&
                room.messages != null &&
                room.messages.isNotEmpty) {
              print('Updating!');

              updateMessages(room.messages.toList());
            }
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    '${otherUser(context).name}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                CircularProfileThumb(
                  user: otherUser(context),
                  borderWidth: 2,
                  radius: 22,
                )
              ],
            ),
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              BlocListener<MessageBloc, MessageState>(
                listenWhen: (previous, current) => current is MessageSuccess,
                listener: (context, state) {
                  if (state is MessageSuccess) {
                    updateMessages(state.room.messages.toList());
                  }
                },
                child: ListView(
                    reverse: true,
                    shrinkWrap: true,
                    children: <Widget>[
                      SizedBox(
                        height: kToolbarHeight + 20,
                      )
                    ]..addAll(_messages.reversed
                        .map(
                          (message) => BubbleMessage(
                              text: message.text,
                              time: message.createdAt.timeago(
                                  locale: AppLocalizations.of(context)
                                      .locale
                                      .languageCode),
                              isMine:
                                  otherUser(context).id != message.sender.id,
                              delivered: message.id.isEmpty ? false : true),
                        )
                        .toList())),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: MessageBar(
                    otherUserId: otherUser(context).id,
                    onSubmitted: (str) => addMessage(text: str),
                  )),
            ],
          ),
        ));
  }

  void updateMessages(List<Message> messages) {
    setState(() {
      _messages = messages;
      _messages?.sort((one, two) => one.createdAt.compare(two.createdAt));
    });
  }

  void addMessage({String text, Message message}) {
    setState(() {
      _messages.add(message ??
          Message((m) => m
            ..ad = null
            ..createdAt = DateTime.now()
            ..updatedAt = DateTime.now()
            ..id = ''
            ..text = text
            ..sender =
                context.bloc<AuthBloc>().state.authStatus.authData?.user));
    });
  }

  User otherUser(BuildContext context) =>
      (context.bloc<AuthBloc>().state.authStatus.authData?.user?.id ?? false) ==
              widget.room.user1.id
          ? widget.room.user2
          : widget.room.user1;
}

class MessageBar extends StatefulWidget {
  final String otherUserId;
  final Function(String text) onSubmitted;

  MessageBar({@required this.otherUserId, @required this.onSubmitted});

  @override
  _MessageBarState createState() => _MessageBarState();
}

class _MessageBarState extends State<MessageBar> {
  TextEditingController textEditingController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
            child: Stack(
              children: [
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          constraints: BoxConstraints(
                            minHeight: kToolbarHeight * .8,
                          ),
                          child: Material(
                            elevation: 4.0,
                            color: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Center(
                                child: TextField(
                                  keyboardType: TextInputType.multiline,
                                  autocorrect: false,
                                  focusNode: _focusNode,
                                  decoration: InputDecoration.collapsed(
                                      hintText: AppLocalizations.of(context)
                                          .translate('send_a_message')),
                                  controller: textEditingController,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AnimatedIconButton(
                          elevation: 4,
                          size: 45,
                          colors: [
                            AppTheme.kAccentColor,
                            AppTheme.kFourthColor
                          ],
                          disabledColors: [
                            Theme.of(context).disabledColor,
                            Theme.of(context).disabledColor
                          ],
                          child: Transform.rotate(
                              angle: math.pi * 1.5, child: Icon(Icons.send)),
                          onTap: isMessageValid
                              ? () => onSubmit(textEditingController.text)
                              : null,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  bool get isMessageValid =>
      textEditingController.text != null &&
      textEditingController.text.trim().isNotEmpty;

  void onSubmit(str) {
    textEditingController.clear();
    FocusScope.of(context).requestFocus(_focusNode);

    widget.onSubmitted(str);

    context
        .bloc<MessageBloc>()
        .add(MessageSent(text: str, toUserId: widget.otherUserId));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    textEditingController.dispose();
    super.dispose();
  }
}
