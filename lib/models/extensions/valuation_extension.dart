import 'package:flutter/material.dart';
import 'package:jumpets_app/models/users/particular.dart';
import 'package:jumpets_app/models/users/profesional.dart';
import 'package:jumpets_app/models/users/protectora.dart';
import 'package:jumpets_app/models/users/user.dart';
import 'package:jumpets_app/models/users/valuation.dart';
import 'package:jumpets_app/ui/components/jumpets_icons_icons.dart';
import '../../ui/app_theme.dart';

extension ValuationExtension on Valuation {
  Widget valuationsStars({Color color}) => Builder(
        builder: (context) => Row(
            children: List.generate(5, (index) {
          double result = this.value - index;

          if (result <= 0) {
            return Icon(Icons.star_border,
                color: color ?? Theme.of(context).accentColor);
          }
          if (result < 1) {
            return Icon(Icons.star_half,
                color: color ?? Theme.of(context).accentColor);
          }
          return Icon(Icons.star,
              color: color ?? Theme.of(context).accentColor);
        })),
      );
}
