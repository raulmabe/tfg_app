import 'package:flutter/material.dart';

class MyRaisedButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final Color textColor;
  final bool filled;
  final bool blocked;
  final bool borders;
  final Widget child;
  final String tag;

  const MyRaisedButton({
    this.tag,
    this.blocked = false,
    this.borders = true,
    this.child,
    @required this.text,
    this.onPressed,
    this.color,
    this.textColor,
    this.filled = true,
    Key key,
  })  : assert(text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Color finalColor =
        blocked ? Colors.grey : color ?? Theme.of(context).accentColor;

    return Hero(
      tag: tag ?? text,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SizedBox(
          height: 40,
          child: Material(
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: borders ? 1 : 0,
                    color: borders ? finalColor : Colors.transparent),
                borderRadius: BorderRadius.circular(5)),
            color: (filled ? finalColor : Colors.transparent),
            child: InkWell(
              onTap: blocked ? null : onPressed,
              splashColor:
                  color?.withOpacity(.3) ?? Colors.white.withOpacity(.3),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: child != null
                    ? FittedBox(
                        child: child,
                      )
                    : FittedBox(
                        child: Text(
                          text.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                              color: textColor ?? color ?? Colors.white),
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
