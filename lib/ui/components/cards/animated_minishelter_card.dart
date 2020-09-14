import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/ui/profile_page/profile_page.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:math' as math;

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
          borderRadius: BorderRadius.circular(20),
        ),
        openBuilder: (context, action) => ProfilePage(
              user: shelter,
            ),
        closedBuilder: (context, action) => Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: edgePadding / 2, vertical: edgePadding / 2),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: FadeInImage.memoryNetwork(
                            alignment: Alignment(-(offset.abs() * 2), 0),
                            fadeInDuration: Duration(milliseconds: 200),
                            placeholder: kTransparentImage,
                            image: shelter.thumbnail,
                            fit: BoxFit.cover,
                            height: 70,
                            width: 70,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(shelter.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                ),
                                shelter.oneStarWidget,
                                Text(shelter.valuationAvg.toStringAsFixed(1),
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 7),
                              child: Text(
                                shelter.address,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _getDetail(
                          context,
                          Icons.directions_car,
                          shelter.travelTime.toDouble().isMoreThanAnHour
                              ? shelter.travelTime.toDouble().toHoursFromSeconds
                              : shelter.travelTime
                                  .toDouble()
                                  .toMinutesFromSeconds,
                          shelter.travelTime.toDouble().isMoreThanAnHour
                              ? 'h'
                              : 'min'),
                      _getDetail(context, FontAwesomeIcons.mapPin,
                          shelter.distance.toDouble().toKmFromMeters, 'km'),
                    ],
                  )
                ],
              ),
            ));
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
