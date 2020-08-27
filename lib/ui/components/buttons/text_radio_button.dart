import 'package:flutter/material.dart';

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
        borderRadius: BorderRadius.circular(10),
        child: Material(
          color: color(context).withOpacity(.5),
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: isSelected
                    ? Theme.of(context).textTheme.bodyText1
                    : Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color color(context) =>
      isSelected ? Theme.of(context).accentColor : Colors.grey.shade200;
}
