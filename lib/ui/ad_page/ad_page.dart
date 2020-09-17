import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/favs_bloc/favourites_bloc.dart';
import 'package:jumpets_app/blocs/rooms_bloc/rooms_bloc.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/models/ads/animals/dog_ad.dart';
import 'package:jumpets_app/models/chats/message.dart';
import 'package:jumpets_app/models/chats/room.dart';
import 'package:built_collection/built_collection.dart';
import 'package:jumpets_app/models/enums/delivery_status.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/ui/components/buttons/icon_button.dart';
import 'package:jumpets_app/ui/components/image_carousel.dart';
import 'package:jumpets_app/ui/components/info_square.dart';
import 'package:jumpets_app/models/extensions/string_extension.dart';
import 'package:jumpets_app/models/extensions/bool_extension.dart';
import 'package:jumpets_app/ui/components/photo_icon.dart';
import 'package:jumpets_app/ui/components/profile_icon.dart';
import 'package:jumpets_app/ui/components/buttons/raised_button.dart';
import 'package:jumpets_app/ui/components/sex_icon.dart';
import 'package:jumpets_app/ui/components/tags.dart';
import 'package:jumpets_app/ui/components/user_chip.dart';
import 'package:jumpets_app/ui/helper.dart';

class AdPage extends StatelessWidget {
  final Ad ad;
  final double edgePadding;
  AdPage({@required this.ad, this.edgePadding = 20.0});

  final ValueNotifier<int> notifierChangeImage = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          CustomScrollView(slivers: [
            SliverAppBar(
              iconTheme: Theme.of(context).appBarTheme.iconTheme,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
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
                        bottomRight: Radius.circular(32),
                        bottomLeft: Radius.circular(32),
                      ),
                      child: ValueListenableBuilder<int>(
                        valueListenable: notifierChangeImage,
                        builder: (context, value, child) => ImageCarousel(
                          selectedIndex: value,
                          imagesUrls: ad.photos.toList(),
                          onChanged: (index) =>
                              notifierChangeImage.value = index,
                        ),
                      )),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    isAnimal ? _animalHeader(context) : _othersHeader(context),
                    isAnimal ? _InfoSquares(ad: ad) : Container(),
                    _about(context),
                    _morePhotosLayout(context),
                    SizedBox(
                      height: kToolbarHeight * 2,
                    )
                  ]),
            )
          ]),
          Positioned(left: 0, bottom: 10, right: 0, child: _bottomBar(context))
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

  List<String> get tags => isAnimal
      ? (ad as AnimalAd).tags.toList()
      : isProduct
          ? (ad as ProductAd).tags.toList()
          : (ad as ServiceAd).tags.toList();

  Widget _othersHeader(context) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: edgePadding, vertical: edgePadding),
        child: Row(children: [
          Expanded(
              child: Text(title.capitalize(),
                  style: Theme.of(context).textTheme.headline4)),
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
              Text((ad as AnimalAd).name.capitalize(),
                  style: Theme.of(context).textTheme.headline4),
              Text((ad as AnimalAd).breed.capitalize(),
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
                  CircularProfileThumb(
                    borderWidth: 1,
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
                            Text(ad.creator.valuationAvg.toStringAsFixed(1))
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
          if (isAnimal && (ad as AnimalAd).mustKnow != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
              child: Text((ad as AnimalAd).mustKnow),
            ),
          Wrap(
              direction: Axis.horizontal,
              children: tags
                  .map((tags) => Tag(
                        tag: tags,
                        tapable: isAnimal,
                      ))
                  .toList()
                    ..addAll(isAnimal
                        ? (ad as AnimalAd)
                            .personality
                            .map((personality) => Tag(
                                  tag: personality,
                                  tapable: false,
                                ))
                            .toList()
                        : [])),
        ],
      ));

  Widget _morePhotosLayout(context) => ad.photos.length > 1
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(left: edgePadding, bottom: edgePadding / 2),
              child: Text(AppLocalizations.of(context).translate('more_photos'),
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                      children: ad.photos
                          .map((url) => GestureDetector(
                                onTap: () => notifierChangeImage.value =
                                    ad.photos.indexOf(url),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: ValueListenableBuilder<int>(
                                    valueListenable: notifierChangeImage,
                                    builder: (context, value, child) =>
                                        PhotoIcon(
                                            borderWidth:
                                                ad.photos[value] == url ? 2 : 0,
                                            url: url,
                                            margin: EdgeInsets.only(
                                                left: ad.photos.first == url
                                                    ? edgePadding
                                                    : 0)),
                                  ),
                                ),
                              ))
                          .toList()),
                ))
          ],
        )
      : Container();

  Widget _bottomBar(context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<AuthBloc, AuthState>(
            buildWhen: (previous, current) =>
                previous.authStatus.status != current.authStatus.status,
            builder: (context, state) {
              bool isAuth = state.authStatus.status.isAuthenticated;

              if (isAuth &&
                  state.authStatus.authData?.user?.id == ad.creator?.id)
                return Container();

              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: BlocBuilder<FavouritesBloc, FavouritesState>(
                      builder: (context, state) {
                        bool alreadyFaved = false;
                        if (state is FavouritesSuccess) {
                          alreadyFaved =
                              state.ads.any((element) => element.id == ad.id);
                        }
                        return MyIconButton(
                          color: Theme.of(context).backgroundColor,
                          size: 50,
                          child: state is FavouritesLoading
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FittedBox(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : Icon(
                                  alreadyFaved
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: alreadyFaved
                                      ? Colors.pinkAccent
                                      : Theme.of(context).iconTheme.color),
                          onTap: () => isAuth
                              ? context.bloc<FavouritesBloc>().add(alreadyFaved
                                  ? FavouriteAdRemoved(adId: ad.id)
                                  : FavouriteAdAdded(ad: ad))
                              : Helper.showLoginBottomSheet(context),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: MyRaisedButton(
                      text: AppLocalizations.of(context).translate('contact'),
                      onPressed: () async {
                        if (!isAuth) {
                          Helper.showLoginBottomSheet(context);
                        } else {
                          Room room = (await (context
                                  .bloc<RoomsBloc>()
                                  .gotAlreadyRoomWithUser(ad.creator))) ??
                              Room((r) => r
                                ..createdAt = DateTime.now()
                                ..updatedAt = DateTime.now()
                                ..id = ''
                                ..user1 = ad.creator
                                ..user2 = state.authStatus.authData.user
                                ..messages =
                                    BuiltList<Message>([]).toBuilder());
                          Navigator.pushNamed(context, '/chat',
                              arguments: room);
                        }
                      },
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
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
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: <Widget>[
                  InfoSquare(
                      title: AppLocalizations.of(context)
                          .translate('adoption_tax'),
                      value: ad.adoptionTax.toStringAsPrecision(2)),
                  InfoSquare(
                      title: AppLocalizations.of(context).translate('age'),
                      value:
                          (DateTime.now().difference(ad.birthDate).inDays / 365)
                              .floor()
                              .toString()),
                  InfoSquare(
                      title: AppLocalizations.of(context).translate('weight'),
                      value: '${ad.weight.toString()} kg'),
                  ad is DogAd
                      ? InfoSquare(
                          title: AppLocalizations.of(context).translate('size'),
                          value: (ad as DogAd).size.name.capitalize())
                      : Container(),
                  InfoSquare(
                      title: AppLocalizations.of(context)
                          .translate('activity_level'),
                      value: ad.activityLevel.name.capitalize()),
                ]..addAll(DeliveryStatus.values.map((deliveryStatus) =>
                    InfoSquare(
                        title: AppLocalizations.of(context)
                            .translate(deliveryStatus.name.toLowerCase()),
                        value: AppLocalizations.of(context).translate(ad
                            .deliveryInfo
                            .contains(deliveryStatus)
                            .stringify()
                            .toLowerCase())))),
              ),
            )),
      );

  AnimalAd get ad => widget.ad;
}
