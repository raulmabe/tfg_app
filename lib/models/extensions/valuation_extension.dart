import 'package:flutter/material.dart';
import 'package:jumpets_app/models/users/valuation.dart';

extension ValuationExtension on Valuation {
  Widget valuationsStars({Color color, double size}) => Builder(
        builder: (context) => Row(
            children: List.generate(5, (index) {
          double result = this.value - index;

          if (result <= 0) {
            return Icon(Icons.star_border,
                color: color ?? Theme.of(context).accentColor, size: size);
          }
          if (result < 1) {
            return Icon(Icons.star_half,
                color: color ?? Theme.of(context).accentColor, size: size);
          }
          return Icon(Icons.star,
              color: color ?? Theme.of(context).accentColor, size: size);
        })),
      );
}
