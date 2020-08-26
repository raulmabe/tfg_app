import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/ui/profile_page/profile_page.dart';
import 'package:transparent_image/transparent_image.dart';

class ShelterCard extends StatelessWidget {
  final Protectora shelter;
  final bool isSelected;
  ShelterCard({@required this.shelter, this.isSelected = false})
      : assert(shelter != null);
  @override
  Widget build(BuildContext context) {
    const double edgePadding = 20;
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
            left: edgePadding,
            right: edgePadding,
            top: 0,
            bottom: edgePadding * 4,
            child: _img()),
        Positioned(
            left: 0,
            right: 0,
            bottom: edgePadding * 2,
            child: _infoCard(context, edgePadding)),
      ],
    );
  }

  Widget _infoCard(context, double edgePadding) {
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
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: edgePadding, vertical: 7),
              child: Text(
                shelter.address,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Material(
                color: Theme.of(context).backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Spacer(),
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
                      Spacer(),
                      _getDetail(context, FontAwesomeIcons.mapPin,
                          shelter.distance.toDouble().toKmFromMeters, 'km'),
                      Spacer(),
                    ],
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
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: FadeInImage.memoryNetwork(
        fadeInDuration: Duration(milliseconds: 200),
        placeholder: kTransparentImage,
        image: shelter.thumbnail,
        fit: BoxFit.cover,
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
