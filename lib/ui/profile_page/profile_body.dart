import 'package:content_placeholder/content_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/search_bloc/search_ads_bloc.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/ui/components/background_illustrations/spaces.dart';
import 'package:jumpets_app/ui/components/cards/animal_card.dart';
import 'package:jumpets_app/ui/components/cards/other_card.dart';
import 'package:jumpets_app/ui/components/cards/valuation.dart';
import 'package:jumpets_app/ui/components/forms/valuation_forms.dart';
import 'package:jumpets_app/ui/components/tab_indicator.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBody extends StatelessWidget {
  final User user;
  ProfileBody({@required this.user}) : assert(user != null);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32), topRight: Radius.circular(32)),
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32))),
        color: Theme.of(context).backgroundColor,
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                  labelStyle: Theme.of(context).textTheme.headline6,
                  labelColor: Colors.grey.shade800,
                  unselectedLabelColor: Colors.black26,
                  indicator: CircleTabIndicator(
                      color: Theme.of(context).accentColor, radius: 3),
                  tabs: [
                    Tab(
                      child: Text(
                        AppLocalizations.of(context).translate('ads'),
                      ),
                    ),
                    Tab(
                      child: Text(
                        AppLocalizations.of(context).translate('valuations'),
                      ),
                    )
                  ]),
              Expanded(
                child: Material(
                  color: Theme.of(context).backgroundColor,
                  child: TabBarView(
                    children: [
                      _adsBody(context),
                      _reviewsBody(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _adsBody(context) {
    return BlocBuilder<SearchAdsBloc, SearchAdsState>(
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
        } else if (state is SearchAdsSuccess && (state.ads.isNotEmpty)) {
          return ListView(children: [
            // * Animal Ads
            state.ads.whereType<AnimalAd>().isNotEmpty
                ? _SearchSection(
                    title:
                        AppLocalizations.of(context).translate('in_adoption'),
                    row: state.ads
                        .whereType<AnimalAd>()
                        .map((e) => AnimalCard(
                              small: true,
                              animalAd: e,
                              height: boxHeight,
                              width: boxHeight,
                            ))
                        .toList())
                : Container(),

            // * Product Ads
            state.ads.whereType<ProductAd>().isNotEmpty
                ? _SearchSection(
                    title:
                        AppLocalizations.of(context).translate('product_ads'),
                    row: state.ads
                        .whereType<ProductAd>()
                        .map((e) => OtherCard(
                              small: true,
                              ad: e,
                              height: boxHeight,
                              width: boxHeight,
                            ))
                        .toList())
                : Container(),

            // * Service Ads
            state.ads.whereType<ServiceAd>().isNotEmpty
                ? _SearchSection(
                    title:
                        AppLocalizations.of(context).translate('service_ads'),
                    row: state.ads
                        .whereType<ServiceAd>()
                        .map((e) => OtherCard(
                              small: true,
                              ad: e,
                              height: boxHeight,
                              width: boxHeight,
                            ))
                        .toList())
                : Container(),
          ]);
        }
        return Column(
          children: [
            Spacer(),
            EmptySpace(),
            Spacer(
              flex: 2,
            ),
          ],
        );
      },
    );
  }

  Widget _reviewsBody(context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        List<Valuation> valuations = user.valuations?.toList();
        User userAuth;
        Valuation valuation;

        if (state.authStatus?.status?.isAuthenticated == true) {
          userAuth = state.authStatus.authData.user;
          valuation = valuations?.firstWhere(
              (val) => val.author.id == userAuth.id,
              orElse: () => null);

          if (valuation != null) {
            valuations = valuations
                .where((valuation) => valuation.author.id != userAuth.id)
                .toList();
          }
        }

        valuations?.sort((one, two) => one.createdAt.compare(two.createdAt));

        if (valuations.isEmpty) {
          return Column(
            children: [
              Spacer(),
              EmptySpace(),
              Spacer(
                flex: 2,
              ),
            ],
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                OwnValuation(
                    userToValuate: user,
                    userAuth: userAuth,
                    valuation: valuation),
                if (valuations != null)
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: valuations?.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ValuationCard(valuations.reversed.toList()[index]),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
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
                      borderRadius: 20,
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
                                    borderRadius: 20,
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
