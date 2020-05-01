import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jumpets_app/models/ads/ad.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/ui/components/animal_card.dart';
import 'package:jumpets_app/ui/components/info_card.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class VerticalGrid extends StatelessWidget {
  final List<Ad> ads;

  VerticalGrid({this.ads});

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
          children: [
            InfoCard(
              title: 'Jumpets',
              message:
                  'Check our last update! This new version (2.2v) comes with 3 new functionalities.',
            )
          ]..addAll(ads
              .map((ad) => AnimalCard(
                    animalAd: ad as AnimalAd,
                  ))
              .toList()),
          staggeredTiles:
              List.generate(ads.length, (int index) => StaggeredTile.fit(1))),
    );
  }
}
