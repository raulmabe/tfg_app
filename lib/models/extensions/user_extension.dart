import 'package:flutter/material.dart';
import 'package:jumpets_app/models/users/particular.dart';
import 'package:jumpets_app/models/users/profesional.dart';
import 'package:jumpets_app/models/users/protectora.dart';
import 'package:jumpets_app/models/users/user.dart';
import 'package:jumpets_app/ui/components/jumpets_icons_icons.dart';
import '../../ui/app_theme.dart';

extension UserExtension on User {
  bool get isProtectora => this is Protectora;
  bool get isProfesional => this is Profesional;
  bool get isParticular => this is Particular;

  double get valuationAvg {
    double sum = 0;
    if (this.valuations == null || this.valuations.isEmpty) return 0;
    this.valuations?.forEach((valuation) {
      sum += valuation.value;
    });
    return sum / this.valuations.length;
  }

  Widget get oneStarWidget => Icon(
        (this.valuationAvg == 0)
            ? Icons.star_border
            : (this.valuationAvg < 5) ? Icons.star_half : Icons.star,
        color: this.colorFromType,
      );

  Widget get valuationsStars => Row(
          children: List.generate(5, (index) {
        double result = this.valuationAvg - index;

        if (result <= 0) {
          return Icon(Icons.star_border, color: this.colorFromType);
        }
        if (result < 1) {
          return Icon(Icons.star_half, color: this.colorFromType);
        }
        return Icon(Icons.star, color: this.colorFromType);
      })
            ..add(Text(' ${this?.valuations?.length ?? 0}')));

  String get stringFromType {
    if (isParticular) return 'private';
    if (isProfesional) return 'professional';
    if (isProtectora) return 'shelter';
    return 'Anon';
  }

  IconData get iconFromType {
    if (isProfesional) return JumpetsIcons.profesional;
    if (isProtectora) return JumpetsIcons.protectoras;
    return null;
  }

  Color get colorFromType {
    if (isProfesional) return AppTheme.kThirdColor;
    if (isProtectora) return Colors.orange.shade200;
    if (isParticular) return AppTheme.kAccentColor;

    throw new UnimplementedError('$this has no color');
  }
}
