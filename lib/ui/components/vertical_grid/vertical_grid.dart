import 'package:content_placeholder/content_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jumpets_app/models/ads/ad.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/models/ads/product_ad.dart';
import 'package:jumpets_app/models/ads/service_ad.dart';
import 'package:jumpets_app/ui/components/cards/animal_card.dart';
import 'package:jumpets_app/ui/components/cards/info_card.dart';
import 'package:jumpets_app/ui/components/cards/product_card.dart';

class VerticalGrid extends StatelessWidget {
  final List<Ad> ads;
  final Widget widgetInjection;
  final bool usePlaceholders;
  final bool insertPlaceholderAtLast;

  VerticalGrid(
      {this.ads,
      this.widgetInjection,
      this.usePlaceholders = false,
      this.insertPlaceholderAtLast = false});

  @override
  Widget build(BuildContext context) {
    final list = usePlaceholders
        ? List<Widget>.generate(
            6,
            (index) => ContentPlaceholder(
                  height: 210,
                ))
        : List<Widget>.from(ads.map((ad) {
            if (ad is ProductAd) {
              return ProductCard(
                productAd: ad,
              );
            }
            if (ad is ServiceAd) {
              return ProductCard(
                productAd: ad as ProductAd,
              );
            }
            return AnimalCard(
              animalAd: ad as AnimalAd,
            );
          }).toList());

    if (widgetInjection != null) {
      list.insert(0, widgetInjection);
    }

    if (insertPlaceholderAtLast) {
      list.add(ContentPlaceholder(
        height: 210,
      ));
    }

    return Container(
      child: StaggeredGridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          children: list,
          staggeredTiles: List.generate(list.length, (int index) {
            if (list[index] is InfoCard && (list[index] as InfoCard).big) {
              return StaggeredTile.fit(2);
            } else
              return StaggeredTile.fit(1);
          })),
    );
  }
}
