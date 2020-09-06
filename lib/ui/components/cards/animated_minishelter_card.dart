import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/ui/profile_page/profile_page.dart';

class AnimatedShelterCard extends ImplicitlyAnimatedWidget {
  final double edgePadding, offset = 0;
  final Protectora shelter;
  final bool isSelected;
  AnimatedShelterCard(
      {@required this.edgePadding, @required this.shelter, this.isSelected})
      : super(duration: Duration(milliseconds: 300));

  @override
  AnimatedShelterCardState createState() => AnimatedShelterCardState();
}

class AnimatedShelterCardState
    extends AnimatedWidgetBaseState<AnimatedShelterCard> {
  DoubleTween _doubleTween;

  double get edgePadding => widget.edgePadding;
  double get offset => widget.offset;
  Protectora get shelter => widget.shelter;
  bool get isSelected => widget.isSelected;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: _doubleTween.evaluate(animation),
      closedColor: Theme.of(context).primaryColor,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      openBuilder: (context, action) => ProfilePage(
        user: shelter,
      ),
      closedBuilder: (context, action) => Material(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: edgePadding, right: edgePadding, top: edgePadding / 2),
              child: Transform.translate(
                offset: Offset(32 * offset, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(shelter.name,
                          style: Theme.of(context).textTheme.subtitle1),
                    ),
                    shelter.oneStarWidget,
                    Text(shelter.valuationAvg.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.subtitle1),
                  ],
                ),
              ),
            ),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: edgePadding, vertical: 7),
              child: Transform.translate(
                offset: Offset(48 * offset, 0),
                child: Text(
                  shelter.address,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Material(
                color: Theme.of(context).backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Transform.translate(
                    offset: Offset(60 * offset, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Spacer(),
                        _getDetail(
                            context,
                            Icons.directions_car,
                            shelter.travelTime.toDouble().isMoreThanAnHour
                                ? shelter.travelTime
                                    .toDouble()
                                    .toHoursFromSeconds
                                : shelter.travelTime
                                    .toDouble()
                                    .toMinutesFromSeconds,
                            shelter.travelTime.toDouble().isMoreThanAnHour
                                ? 'h'
                                : 'min'),
                        Spacer(),
                        _getDetail(context, FontAwesomeIcons.mapPin,
                            shelter.distance.toDouble().toKmFromMeters, 'km'),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getDetail(context, IconData icon, int value, String units) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).accentColor,
        ),
        SizedBox(
          width: 5,
        ),
        Column(
          children: [
            Text(value.toString(),
                style: Theme.of(context).textTheme.bodyText1),
            Text(units),
          ],
        )
      ],
    );
  }

  double get targetElevation => isSelected ? 3 : 0;

  @override
  void forEachTween(visitor) {
    _doubleTween = visitor(
        _doubleTween, targetElevation, (value) => DoubleTween(begin: value));
  }
}

class DoubleTween extends Tween<double> {
  DoubleTween({double begin, double end}) : super(begin: begin, end: end);

  double lerp(double t) {
    return lerpDouble(begin, end, t);
  }
}
