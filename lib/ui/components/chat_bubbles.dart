import 'package:flutter/material.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/models/chats/message.dart';
import 'package:jumpets_app/models/models.dart';

class BubbleMessage extends StatefulWidget {
  final String text, time;
  final bool delivered, isMine;
  BubbleMessage({
    this.text,
    this.time,
    this.delivered,
    this.isMine,
  });
  @override
  _BubbleMessageState createState() => _BubbleMessageState();
}

class _BubbleMessageState extends State<BubbleMessage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 200));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final bg = isMine
        ? Theme.of(context).primaryColor
        : Theme.of(context).primaryColor;
    final align = isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final icon = delivered ? Icons.done : Icons.access_time;
    final iconColor = delivered ? Theme.of(context).accentColor : Colors.grey;
    final radius = isMine
        ? BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          )
        : BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
            parent: animationController, curve: Curves.bounceInOut),
        axisAlignment: 0.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              crossAxisAlignment: align,
              children: <Widget>[
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * .6),
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: .5,
                          spreadRadius: 1.0,
                          color: Colors.black.withOpacity(.12))
                    ],
                    color: bg,
                    borderRadius: radius,
                  ),
                  child: Text(
                    text,
                    softWrap: true,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Row(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                    time,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontSize: 12),
                  ),
                  if (isMine) SizedBox(width: 3.0),
                  if (isMine)
                    Icon(
                      icon,
                      size: 16.0,
                      color: iconColor,
                    )
                ])
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  String get time => widget.time;
  String get text => widget.text;
  bool get isMine => widget.isMine;
  bool get delivered => widget.delivered;
}
