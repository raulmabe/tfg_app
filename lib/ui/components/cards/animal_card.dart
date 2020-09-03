import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/ui/ad_page/ad_page.dart';
import 'package:jumpets_app/ui/components/sex_icon.dart';
import 'package:jumpets_app/ui/components/user_chip.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:jumpets_app/models/models.dart';

class AnimalCard extends StatelessWidget {
  final AnimalAd animalAd;
  final bool small;
  final double height;
  final double width;

  AnimalCard(
      {@required this.animalAd,
      this.small = false,
      @required this.height,
      this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          width: width,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            SizedBox(
              height: height + 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(animalAd.name.capitalize(),
                          style: small
                              ? Theme.of(context).textTheme.bodyText2
                              : Theme.of(context).textTheme.subtitle1),
                      small
                          ? Container()
                          : Text(
                              '${(DateTime.now().difference(animalAd.birthDate).inDays / 365).floor().toString()} ${AppLocalizations.of(context).translate('years')}',
                            )
                    ],
                  ),
                ),
                SexIcon(male: animalAd.male)
              ],
            )
          ]),
        ),
        OpenContainer(
          closedElevation: 3,
          closedColor: Colors.transparent,
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          openBuilder: (context, action) => AdPage(
            ad: animalAd,
          ),
          closedBuilder: (context, action) => Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage.memoryNetwork(
                  fadeInDuration: Duration(milliseconds: 200),
                  width: width,
                  height: height,
                  placeholder: kTransparentImage,
                  image: animalAd.photos.first,
                  fit: BoxFit.cover,
                ),
              ),
              if (!small)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: UserChip(
                    tag: '${animalAd.id}-${animalAd.creator.id}',
                    user: animalAd.creator,
                    small: true,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
