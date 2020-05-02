import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/ui/ad_page/ad_page_vm.dart';
import 'package:jumpets_app/ui/components/sex_icon.dart';
import 'package:transparent_image/transparent_image.dart';

class AnimalCard extends StatelessWidget {
  final AnimalAd animalAd;
  final bool extended;
  final double height;

  AnimalCard({@required this.animalAd, this.extended = false}) : height = 210;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: 0,
      closedColor: Colors.transparent,
      openBuilder: (context, action) => AdPageBuilder(
        ad: animalAd,
      ),
      closedBuilder: (context, action) => Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
                                style: Theme.of(context).textTheme.body2),
                          ),
                          SexIcon(male: animalAd.male)
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              '${(DateTime.now().difference(animalAd.birthDate).inDays / 365).floor().toString()} años',
                            ),
                          ),
                        ],
                      )
                    ]),
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
      ),
    );
  }
}
