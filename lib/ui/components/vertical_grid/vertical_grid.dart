import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jumpets_app/models/ads/ad.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/ui/components/animal_card.dart';

class VerticalGrid extends StatelessWidget {
  final List<Ad> ads;
  final Widget widgetInjection;

  VerticalGrid({this.ads, this.widgetInjection});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StaggeredGridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          children: (widgetInjection == null ? [] : [widgetInjection])
            ..addAll(ads
                .map((ad) => AnimalCard(
                      animalAd: ad as AnimalAd,
                    ))
                .toList()),
          staggeredTiles: List.generate(
              ads.length + 1, (int index) => StaggeredTile.fit(1))),
    );
  }
}
