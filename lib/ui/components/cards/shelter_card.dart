import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/ui/profile_page/profile_page.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:math' as math;

class ShelterCard extends StatelessWidget {
  final Protectora shelter;
  final bool isSelected;
  final double offset;
  ShelterCard({@required this.shelter, this.isSelected = false, this.offset})
      : assert(shelter != null);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    const double edgePadding = 20;
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _img(),
          SizedBox(
            height: 10,
          ),
          _infoCard(context, edgePadding, gauss),
        ],
      ),
    );
  }

  Widget _infoCard(context, double edgePadding, double offset) {
    return OpenContainer(
      closedElevation: isSelected ? 3 : 0,
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

  Widget _img() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: FadeInImage.memoryNetwork(
        alignment: Alignment(-(offset.abs() * 2), 0),
        fadeInDuration: Duration(milliseconds: 200),
        placeholder: kTransparentImage,
        image: shelter.thumbnail,
        fit: BoxFit.cover,
        width: double.maxFinite,
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
}
