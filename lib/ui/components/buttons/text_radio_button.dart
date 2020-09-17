import 'package:flutter/material.dart';
import 'package:jumpets_app/ui/app_theme.dart';

class TextRadioButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final EdgeInsets margin;
  TextRadioButton(
      {@required this.text,
      this.isSelected = false,
      @required this.onTap,
      this.margin});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: gradient(context))),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: isSelected
                      ? Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Colors.white)
                      : Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color color(context) => isSelected
      ? Theme.of(context).accentColor
      : Theme.of(context).disabledColor;

  List<Color> gradient(context) => isSelected
      ? [
          AppTheme.kFourthColor,
          AppTheme.kAccentColor,
        ]
      : [Theme.of(context).disabledColor, Theme.of(context).disabledColor];
}
