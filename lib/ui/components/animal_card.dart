import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:transparent_image/transparent_image.dart';

class AnimalCard extends StatelessWidget {
  final AnimalAd animalAd;
  final bool extended;
  final double height;

  AnimalCard({@required this.animalAd, this.extended = false}) : height = 210;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            SizedBox(
              height: height,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(children: [
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(animalAd.name,
                          style: Theme.of(context).primaryTextTheme.body2),
                    ),
                    Icon(
                      animalAd.male
                          ? FontAwesomeIcons.mars
                          : FontAwesomeIcons.venus,
                      size: 17,
                      color: animalAd.male
                          ? Theme.of(context).accentColor
                          : Color(0xffFDA7DF),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                          '${(DateTime.now().difference(animalAd.birthDate).inDays / 365).floor().toString()} años',
                          style: Theme.of(context).primaryTextTheme.body1),
                    ),
                  ],
                )
              ]),
              /* child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: animalAd.name,
                        style: Theme.of(context).primaryTextTheme.body2),
                    TextSpan(
                      style: Theme.of(context).primaryTextTheme.body1,
                      text:
                          '\n${(DateTime.now().difference(animalAd.birthDate).inDays / 365).floor().toString()} años',
                    ),
                  ]),
                ) */
            )
          ]),
        ),
        Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage.memoryNetwork(
              width: double.infinity,
              height: height,
              placeholder: kTransparentImage,
              image: animalAd.photos.first,
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}
