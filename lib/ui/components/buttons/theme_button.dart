import 'package:flutter/material.dart';
import 'package:jumpets_app/blocs/theme_bloc/theme_bloc.dart';
import 'package:jumpets_app/ui/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeButton extends StatelessWidget {
  final bool isLight;
  final bool isSelected;
  final bool ignorePointer;

  ThemeButton.light({@required this.isSelected, this.ignorePointer = false})
      : isLight = true;
  ThemeButton.dark({@required this.isSelected, this.ignorePointer = false})
      : isLight = false;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        shape: CircleBorder(
            side: BorderSide(
                color: isSelected ? Theme.of(context).accentColor : Colors.grey,
                width: 2)),
        color: isLight
            ? AppTheme.kSecondaryBackgroundColor
            : AppTheme.kSecondaryBackgroundColorDark,
        child: IgnorePointer(
          ignoring: ignorePointer,
          child: InkWell(
              onTap: () => context
                  .bloc<ThemeBloc>()
                  .add(isLight ? LightModeEnabled() : DarkModeEnabled()),
              child: SizedBox(
                height: 30,
                width: 30,
              )),
        ),
      ),
    );
  }
}
