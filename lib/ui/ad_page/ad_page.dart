import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/favs_bloc/favourites_bloc.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/models/ads/animals/dog_ad.dart';
import 'package:jumpets_app/models/enums/delivery_status.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/ui/components/auth/auth_sheet.dart';
import 'package:jumpets_app/ui/components/icon_button.dart';
import 'package:jumpets_app/ui/components/info_square.dart';
import 'package:jumpets_app/models/extensions/string_extension.dart';
import 'package:jumpets_app/models/extensions/bool_extension.dart';
import 'package:jumpets_app/ui/components/photo_icon.dart';
import 'package:jumpets_app/ui/components/profile_icon.dart';
import 'package:jumpets_app/ui/components/raised_button.dart';
import 'package:jumpets_app/ui/components/sex_icon.dart';
import 'package:jumpets_app/ui/components/soft_transition.dart';
import 'package:jumpets_app/ui/components/tags.dart';
import 'package:jumpets_app/ui/components/user_chip.dart';
import 'package:jumpets_app/ui/helper.dart';
import 'package:jumpets_app/ui/profile_page/profile_page.dart';

class AdPage extends StatelessWidget {
  final Ad ad;
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
              actions: [
                UserChip(
                  user: ad.creator,
                  tag: '${ad.id}-${ad.creator.id}',
                )
              ],
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
                      isAnimal
                          ? _animalHeader(context)
                          : _othersHeader(context),
                      isAnimal ? _InfoSquares(ad: ad) : Container(),
                      _about(context),
                      _morePhotosLayout(context),
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
                  child: BlocBuilder<AuthBloc, AuthState>(
                      buildWhen: (previous, current) =>
                          previous.authStatus.status !=
                          current.authStatus.status,
                      builder: (context, state) {
                        bool isAuth = state.authStatus.status.isAuthenticated;
                        return Row(
                          children: [
                            Expanded(
                              child: MyRaisedButton(
                                  text: 'Contact',
                                  onPressed: () =>
                                      Helper.showLoginBottomSheet(context)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child:
                                  BlocBuilder<FavouritesBloc, FavouritesState>(
                                builder: (context, state) {
                                  bool alreadyFaved = false;
                                  if (state is FavouritesSuccess) {
                                    alreadyFaved = state.ads
                                        .any((element) => element.id == ad.id);
                                  }
                                  return MyIconButton(
                                    color: Colors.grey.shade200,
                                    size: 50,
                                    child: state is FavouritesLoading
                                        ? CircularProgressIndicator()
                                        : Icon(
                                            alreadyFaved
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: alreadyFaved
                                                ? Colors.pinkAccent
                                                : Colors.black54),
                                    onTap: () => isAuth
                                        ? context.bloc<FavouritesBloc>().add(
                                            alreadyFaved
                                                ? FavouriteAdRemoved(
                                                    adId: ad.id)
                                                : FavouriteAdAdded(ad: ad))
                                        : Helper.showLoginBottomSheet(context),
                                  );
                                },
                              ),
                            )
                          ],
                        );
                      }),
                ),
              ))
        ],
      ),
    );
  }

  bool get isService => ad is ServiceAd;
  bool get isProduct => ad is ProductAd;
  bool get isAnimal => ad is AnimalAd;

  String get description => isProduct
      ? (ad as ProductAd).description
      : isService
          ? (ad as ServiceAd).description
          : (ad as AnimalAd).description;

  String get title =>
      isProduct ? (ad as ProductAd).title : (ad as ServiceAd).title;

  double get price =>
      isProduct ? (ad as ProductAd).price : (ad as ServiceAd).priceHour;

  Widget _othersHeader(context) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: edgePadding, vertical: edgePadding),
        child: Row(children: [
          Expanded(
              child: Text(title.capitalize(),
                  style: Theme.of(context).textTheme.display1)),
          Text('${price.toStringAsPrecision(2)} €',
              style: Theme.of(context).textTheme.bodyText1)
        ]),
      );

  Widget _animalHeader(context) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: edgePadding, vertical: edgePadding),
        child: Row(children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text((ad as AnimalAd).name,
                  style: Theme.of(context).textTheme.display1),
              Text((ad as AnimalAd).breed,
                  style: Theme.of(context).textTheme.caption),
            ],
          )),
          SexIcon(
            male: (ad as AnimalAd).male,
            size: 25,
          ),
        ]),
      );

  Widget _about(context) => Padding(
      padding:
          EdgeInsets.symmetric(horizontal: edgePadding, vertical: edgePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, '/profile',
                  arguments: ad.creator),
              child: Row(
                children: [
                  ProfileIcon(
                    user: ad.creator,
                  ),
                  SizedBox(
                    width: edgePadding / 2,
                  ),
                  Text(
                    '${ad.creator.name}:',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Spacer(),
                  ad.creator.isParticular
                      ? Container()
                      : Row(
                          children: [
                            ad.creator.oneStarWidget,
                            Text(ad.creator.valuationAvg.toStringAsFixed(2))
                          ],
                        )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
            child: Text(description),
          ),
          isAnimal
              ? Wrap(
                  direction: Axis.horizontal,
                  children: (ad as AnimalAd)
                      .personality
                      .map((personality) => Tag(tag: personality))
                      .toList(),
                )
              : Container(),
        ],
      ));

  Widget _morePhotosLayout(context) => ad.photos.length > 1
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(left: edgePadding, bottom: edgePadding / 2),
              child:
                  Text('More photos', style: Theme.of(context).textTheme.body2),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                      children: ad.photos
                          .map((url) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: PhotoIcon(
                                    url: url,
                                    margin: EdgeInsets.only(
                                        left: ad.photos.first == url
                                            ? edgePadding
                                            : 0)),
                              ))
                          .toList()),
                ))
          ],
        )
      : Container();
}

class _InfoSquares extends StatefulWidget {
  final AnimalAd ad;
  _InfoSquares({@required this.ad}) : assert(ad != null);
  @override
  __InfoSquaresState createState() => __InfoSquaresState();
}

class __InfoSquaresState extends State<_InfoSquares> {
  ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return _infoSquares(context);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _infoSquares(context) => Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: <Widget>[
                  InfoSquare(
                      title: 'Adoption Tax',
                      value: ad.adoptionTax.toStringAsPrecision(2)),
                  InfoSquare(
                      title: 'Age',
                      value:
                          (DateTime.now().difference(ad.birthDate).inDays / 365)
                              .floor()
                              .toString()),
                  InfoSquare(
                      title: 'Weight', value: '${ad.weight.toString()} kg'),
                  ad is DogAd
                      ? InfoSquare(
                          title: 'Size',
                          value: (ad as DogAd).size.name.capitalize())
                      : Container(),
                  InfoSquare(
                      title: 'Activity Level',
                      value: ad.activityLevel.name.capitalize()),
                ]..addAll(DeliveryStatus.values.map((deliveryStatus) =>
                    InfoSquare(
                        title: deliveryStatus.name.capitalize(),
                        value: ad.deliveryInfo
                            .contains(deliveryStatus)
                            .stringify()))),
              ),
            )),
      );

  AnimalAd get ad => widget.ad;
}
