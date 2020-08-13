import 'package:flutter/material.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/models/ads/animals/dog_ad.dart';
import 'package:jumpets_app/models/enums/delivery_status.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/ui/components/info_square.dart';
import 'package:jumpets_app/models/extensions/string_extension.dart';
import 'package:jumpets_app/models/extensions/bool_extension.dart';
import 'package:jumpets_app/ui/components/photo_icon.dart';
import 'package:jumpets_app/ui/components/profile_icon.dart';
import 'package:jumpets_app/ui/components/sex_icon.dart';
import 'package:jumpets_app/ui/components/tags.dart';

class AdPage extends StatelessWidget {
  final AnimalAd ad;
  final double edgePadding;
  AdPage({@required this.ad, this.edgePadding = 20.0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          CustomScrollView(slivers: [
            SliverAppBar(
              pinned: true,
              stretch: true,
              backgroundColor: Theme.of(context).accentColor,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: [StretchMode.zoomBackground],
                background: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    child: Image.network(
                      ad.photos.first,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Transform.translate(
                offset: Offset(0, -0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _header(context),
                      _infoSquares(context),
                      _about(context),
                      _morePhotosLayout(context),
                      _ownerInfo(context),
                      SizedBox(
                        height: kToolbarHeight * 2,
                      )
                    ]),
              ),
            )
          ]),
          Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RaisedButton(
                      child: Text('Adopt me'), onPressed: () => print('adopt')),
                ),
              ))
        ],
      ),
    );
  }

  bool get isService => ad is ServiceAd;
  bool get isProduct => ad is ProductAd;

  Widget _header(context) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: edgePadding, vertical: edgePadding),
        child: Row(children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(ad.name, style: Theme.of(context).textTheme.display1),
                  SexIcon(
                    male: ad.male,
                    size: 25,
                  ),
                ],
              ),
              Text(ad.breed, style: Theme.of(context).textTheme.caption),
            ],
          )),
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {})
        ]),
      );

  Widget _infoSquares(context) => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InfoSquare(
                title: 'Age',
                value: (DateTime.now().difference(ad.birthDate).inDays / 365)
                    .floor()
                    .toString()),
          ),
          InfoSquare(title: 'Weight', value: '${ad.weight.toString()} kg'),
          ad is DogAd
              ? InfoSquare(
                  title: 'Size', value: (ad as DogAd).size.name.capitalize())
              : Container(),
          InfoSquare(
              title: 'Activity Level',
              value: ad.activityLevel.name.capitalize()),
        ]..addAll(DeliveryStatus.values.map((deliveryStatus) => InfoSquare(
            title: deliveryStatus.name.capitalize(),
            value: ad.deliveryInfo.contains(deliveryStatus).stringify()))),
      ));

  Widget _about(context) => Container(
      padding:
          EdgeInsets.symmetric(horizontal: edgePadding, vertical: edgePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('About', style: Theme.of(context).textTheme.body2),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(ad.description),
          ),
          Wrap(
            direction: Axis.horizontal,
            children: ad.personality
                .map((personality) => Tag(tag: personality))
                .toList(),
          )
        ],
      ));

  Widget _morePhotosLayout(context) => ad.photos.length > 1
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: edgePadding, vertical: edgePadding / 2),
              child:
                  Text('More photos', style: Theme.of(context).textTheme.body2),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: ad.photos
                        .map((url) => PhotoIcon(
                            url: url,
                            margin: EdgeInsets.only(
                                left:
                                    ad.photos.first == url ? edgePadding : 0)))
                        .toList()))
          ],
        )
      : Container();

  Widget _ownerInfo(context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: edgePadding, top: edgePadding),
            padding: EdgeInsets.symmetric(
                horizontal: edgePadding, vertical: edgePadding),
            decoration: BoxDecoration(
                color: Color(0xffDDE2FA),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                )),
            child: Row(children: [
              ProfileIcon(
                url: ad.creator.thumbnail,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: edgePadding),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(ad.creator.name),
                        Text(ad.creator.runtimeType.toString().substring(2))
                      ]),
                ),
              ),
            ]),
          ),
        ],
      );
}
