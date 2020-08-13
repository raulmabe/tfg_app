import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/ui/ad_page/ad_page.dart';
import 'package:jumpets_app/ui/components/sex_icon.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:jumpets_app/models/models.dart';

class ProductCard extends StatelessWidget {
  final ProductAd productAd;
  final bool extended;
  final double height;

  ProductCard({@required this.productAd, this.extended = false})
      : assert(productAd != null),
        height = 210;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openElevation: 0,
      closedElevation: 0,
      closedColor: Colors.transparent,
      openBuilder: (context, action) => AdPage(
          /* ad: productAd, */
          ),
      closedBuilder: (context, action) => Stack(
        children: <Widget>[
          Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(20),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage.memoryNetwork(
                    fadeInDuration: Duration(milliseconds: 250),
                    width: double.infinity,
                    height: height,
                    placeholder: kTransparentImage,
                    image: productAd.photos.first,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: height / 4),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
                width: double.infinity,
                height: height + (height / 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.blueGrey.withOpacity(.05),
                        Colors.blueGrey.withOpacity(.3)
                      ],
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(productAd.title,
                          style: Theme.of(context)
                              .textTheme
                              .body2
                              .copyWith(color: Colors.black87)),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                              text: productAd.price.floor().toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(color: Colors.white),
                              children: [
                                TextSpan(
                                  text: ' €',
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .copyWith(color: Colors.white),
                                )
                              ]),
                        )

                        /* Text('${productAd.price.floor().toString()} €',
                          style: Theme.of(context)
                              .textTheme
                              .body2
                              .copyWith(color: Colors.white)), */
                        ),
                  ],
                )),
          ),

          /* Container(
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: height,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(productAd.title.capitalize(),
                              style: Theme.of(context).textTheme.body2),
                        ),
                        Text('${productAd.price.floor().toString()} €',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle
                                .copyWith(
                                    color: Theme.of(context).accentColor)),
                      ],
                    ),
                  )
                ]),
          ), */
        ],
      ),
    );
  }
}
