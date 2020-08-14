import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/ui/ad_page/ad_page.dart';
import 'package:jumpets_app/ui/components/sex_icon.dart';
import 'package:jumpets_app/ui/components/user_chip.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:jumpets_app/models/models.dart';

class OtherCard extends StatelessWidget {
  final Ad ad;
  final bool small;
  final double height;
  final double width;

  OtherCard(
      {@required this.ad,
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
              children: <Widget>[
                Expanded(
                  child: Text(title.capitalize(),
                      style: small
                          ? Theme.of(context).textTheme.bodyText2
                          : Theme.of(context).textTheme.subtitle1),
                ),
                Text(price.toStringAsPrecision(2),
                    style: small
                        ? Theme.of(context).textTheme.bodyText2
                        : Theme.of(context).textTheme.subtitle1),
              ],
            )
          ]),
        ),
        OpenContainer(
          closedElevation: 3,
          closedColor: Colors.transparent,
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          openBuilder: (context, action) => AdPage(
            ad: ad,
          ),
          closedBuilder: (context, action) => Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage.memoryNetwork(
                  fadeInDuration: Duration(milliseconds: 200),
                  width: width,
                  height: height,
                  placeholder: kTransparentImage,
                  image: ad.photos.first,
                  fit: BoxFit.cover,
                ),
              ),
              small
                  ? Container()
                  : Positioned(
                      bottom: 0,
                      right: 0,
                      child: UserChip(
                        tag: '${ad.id}-${ad.creator.id}',
                        user: ad.creator,
                        small: true,
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }

  bool get isService => ad is ServiceAd;
  bool get isProduct => ad is ProductAd;

  String get description =>
      isProduct ? (ad as ProductAd).description : (ad as ServiceAd).description;

  String get title =>
      isProduct ? (ad as ProductAd).title : (ad as ServiceAd).title;

  double get price =>
      isProduct ? (ad as ProductAd).price : (ad as ServiceAd).priceHour;
}
