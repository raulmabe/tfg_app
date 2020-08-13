import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/ui/ad_page/ad_page.dart';
import 'package:jumpets_app/ui/components/sex_icon.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:jumpets_app/models/models.dart';

class OtherCard extends StatelessWidget {
  final Ad ad;
  final bool extended;
  final double height;
  final double width;

  OtherCard(
      {@required this.ad,
      this.extended = false,
      @required this.height,
      this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: 0,
      closedColor: Colors.transparent,
      openBuilder: (context, action) => AdPage(
        ad: ad,
      ),
      closedBuilder: (context, action) => Stack(
        children: <Widget>[
          Container(
            width: width,
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
                            child: Text(title.capitalize(),
                                style: Theme.of(context).textTheme.body2),
                          ),
                          Text(price.toStringAsPrecision(3).capitalize(),
                              style: Theme.of(context).textTheme.body2),
                        ],
                      ),
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
                fadeInDuration: Duration(milliseconds: 250),
                width: width,
                height: height,
                placeholder: kTransparentImage,
                image: ad.photos.first,
                fit: isService ? BoxFit.cover : BoxFit.contain,
              ),
            ),
          )
        ],
      ),
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
