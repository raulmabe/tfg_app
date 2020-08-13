import 'package:flutter/material.dart';

class MyRaisedButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final Color textColor;
  final bool filled;
  final bool blocked;
  final Widget child;

  const MyRaisedButton({
    this.blocked = false,
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
      tag: text,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Material(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: finalColor,
              ),
              borderRadius: BorderRadius.circular(5)),
          color: (filled ? finalColor : Colors.transparent),
          child: InkWell(
            onTap: blocked ? null : onPressed,
            splashColor: color?.withOpacity(.3) ?? Colors.white.withOpacity(.3),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: child != null
                  ? FittedBox(
                      child: child,
                    )
                  : Text(
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
    );
  }
}
