import 'package:flutter/material.dart';
import 'package:jumpets_app/ui/components/sex_icon.dart';
import 'package:jumpets_app/ui/helper.dart';

class SexRadioButton extends StatelessWidget {
  final bool male;
  final bool isSelected;
  final VoidCallback onTap;
  final EdgeInsets margin;
  SexRadioButton(
      {@required this.male,
      this.isSelected = false,
      @required this.onTap,
      this.margin});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(8.0),
      child: ClipOval(
        child: Material(
          shape: CircleBorder(),
          color: color(context).withOpacity(.5),
          child: InkWell(
            onTap: onTap,
            child: SexIcon(male: male),
          ),
        ),
      ),
    );
  }

  Color color(context) =>
      isSelected ? Helper.getGenderColor(context, male) : Colors.grey.shade200;
}
