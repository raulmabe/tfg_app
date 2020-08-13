import 'package:content_placeholder/content_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jumpets_app/blocs/ads_bloc/ads_bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/search_bloc/search_ads_bloc.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/models/users/user.dart';
import 'package:jumpets_app/ui/components/cards/animal_card.dart';
import 'package:jumpets_app/ui/components/cards/other_card.dart';
import 'package:jumpets_app/ui/components/soft_transition.dart';
import 'package:jumpets_app/ui/settings_page/settings_page.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  ProfilePage({this.user}) : assert(user != null);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<SearchAdsBloc>(context)..add(AdsSearched(creator: user.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) => _build(
            context,
            state.authStatus == AuthenticationStatus.authenticated &&
                context.bloc<AuthBloc>().authData.user.id == user.id));
  }

  Widget _build(BuildContext context, bool isMyProfile) {
    var actionsList = isMyProfile
        ? [
            IconButton(
                icon: Icon(Icons.edit),
                iconSize: 22,
                onPressed: () => Navigator.of(context)
                    .push(SoftTransition(widget: SettingsPage())),
                color: Colors.black54),
            IconButton(
                icon: Icon(FontAwesomeIcons.slidersH),
                iconSize: 22,
                onPressed: () => Navigator.of(context)
                    .push(SoftTransition(widget: SettingsPage())),
                color: Colors.black54),
          ]
        : <Widget>[];

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Builder(builder: (context) {
          if (isProtectora) {
            return Text('Protectora',
                style: Theme.of(context)
                    .textTheme
                    .display2
                    .copyWith(color: Colors.orangeAccent));
          }
          if (isProfesional) {
            return Text('Profesional',
                style: Theme.of(context)
                    .textTheme
                    .display2
                    .copyWith(color: Colors.indigoAccent));
          }
          return Text('Particular',
              style: Theme.of(context)
                  .textTheme
                  .display2
                  .copyWith(color: Theme.of(context).accentColor));
        }),
        centerTitle: true,
        actions: actionsList,
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.grey),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      user.thumbnail,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(user.name,
                            style: Theme.of(context).textTheme.headline6),
                        Text(
                          user.address,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          user.phone.toString(),
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Row(
                            children: List.generate(5, (index) {
                          double result = valuationAvg - index;

                          if (result <= 0) {
                            return Icon(
                              Icons.star_border,
                              color: Colors.yellow,
                            );
                          }
                          if (result < 1) {
                            return Icon(Icons.star_half, color: Colors.yellow);
                          }
                          return Icon(Icons.star, color: Colors.yellow);
                        })
                              ..add(Text(valuationAvg.toStringAsPrecision(
                                  valuationAvg % 10 > 0 ? 2 : 1)))
                              ..add(Text(
                                  ' (${user?.valuations?.length ?? 0} reviews)')))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: _buildBody(context)),
        ],
      ),
    );
  }

  User get user => widget.user;

  double get valuationAvg {
    double sum = 0;
    if (user?.valuations == null || user.valuations.isEmpty) return 0;
    user?.valuations?.forEach((valuation) {
      sum += valuation.value;
    });
    return sum / user.valuations.length;
  }

  bool get isProtectora => user is Protectora;
  bool get isProfesional => user is Profesional;
  bool get isParticular => user is Particular;

  bool get hasWeb =>
      (isProtectora && (user as Protectora).web != null) ||
      (isProfesional && (user as Profesional).web != null);

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Material(
        color: Theme.of(context).backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        child: BlocBuilder<SearchAdsBloc, SearchAdsState>(
          builder: (context, state) {
            double boxHeight = 100;
            if (state is SearchAdsLoading || state is SearchAdsInitial) {
              return ListView(children: [
                _SearchSection(
                    isLoading: true,
                    boxHeight: boxHeight,
                    row: List.generate(4, (index) => Container())),
                _SearchSection(
                    isLoading: true,
                    boxHeight: boxHeight,
                    row: List.generate(4, (index) => Container())),
              ]);
            } else if (state is SearchAdsSuccess &&
                (state.animalAds.isNotEmpty ||
                    state.productAds.isNotEmpty ||
                    state.serviceAds.isNotEmpty)) {
              return ListView(children: [
                // * Animal Ads
                state.animalAds.isNotEmpty
                    ? _SearchSection(
                        title: 'In adoption',
                        row: state.animalAds
                            .map((e) => AnimalCard(
                                  animalAd: e,
                                  height: boxHeight,
                                  width: boxHeight,
                                ))
                            .toList())
                    : Container(),

                // * Product Ads
                state.productAds.isNotEmpty
                    ? _SearchSection(
                        title: 'Product ads',
                        row: state.productAds
                            .map((e) => OtherCard(
                                  height: boxHeight,
                                  ad: e,
                                ))
                            .toList())
                    : Container(),

                // * Service Ads
                state.serviceAds.isNotEmpty
                    ? _SearchSection(
                        title: 'Service ads',
                        row: state.serviceAds
                            .map((e) => OtherCard(
                                  height: boxHeight,
                                  ad: e,
                                ))
                            .toList())
                    : Container(),
              ]);
            }
            return VoidProfile();
          },
        ),
      ),
    );
  }
}

class _SearchSection extends StatelessWidget {
  final List<Widget> row;
  final String title;
  final bool isLoading;
  final double boxHeight;
  _SearchSection(
      {@required this.row, this.title, this.isLoading = false, this.boxHeight})
      : assert(row != null),
        assert((isLoading && boxHeight != null) || !isLoading);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isLoading
                ? Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, bottom: 0),
                    child: ContentPlaceholder(
                      width: 100,
                      height: 25,
                    ),
                  )
                : Expanded(
                    child: ListTile(
                        title: Text(
                      title,
                      style: Theme.of(context).textTheme.subtitle1,
                    )),
                  ),
            isLoading
                ? Container()
                : Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      row.length.toString(),
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
          ],
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                  children: row
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: !isLoading
                                ? e
                                : ContentPlaceholder(
                                    height: boxHeight,
                                    width: boxHeight,
                                  ),
                          ))
                      .toList()),
            ))
      ],
    );
  }
}

class VoidProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        child: Text('Aye! Too blank'),
      ),
    );
  }
}