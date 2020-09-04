import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/ads_bloc/ads_bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/models/enums/categories.dart';
import 'package:jumpets_app/ui/components/buttons/category_button.dart';
import 'package:jumpets_app/ui/components/cards/info_card.dart';
import 'package:jumpets_app/ui/components/background_illustrations/empty_space.dart';
import 'package:jumpets_app/ui/components/jumpets_icons_icons.dart';
import 'package:jumpets_app/ui/components/shelters_grid.dart';
import 'package:jumpets_app/ui/components/vertical_grid/vertical_grid.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/ui/helper.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class MainPage extends StatefulWidget {
  final ScrollController scrollController;

  MainPage({this.scrollController});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    var adsBloc = context.bloc<AdsBloc>();
    return BlocBuilder<AdsBloc, AdsState>(
      buildWhen: (previous, current) => current is CategoryChanged,
      builder: (context, state) => LiquidPullToRefresh(
        showChildOpacityTransition: false,
        onRefresh: () {
          adsBloc.add(LastAdsRefreshed());
          return _refreshCompleter.future;
        },
        child: CustomScrollView(
          controller: widget.scrollController,
          physics: adsBloc.category == Category.SHELTERS
              ? NeverScrollableScrollPhysics()
              : BouncingScrollPhysics(),
          shrinkWrap: true,
          slivers: [
            _title(adsBloc),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: BlocBuilder<AdsBloc, AdsState>(
                          buildWhen: (prev, current) =>
                              current is SearchModeChanged,
                          builder: (context, state) {
                            return RoundedSquareButton(
                                isBlocked: !context
                                    .bloc<AdsBloc>()
                                    .isCategoryValidToSearch,
                                size: 50,
                                borderRadius: 10,
                                isSelected: context.bloc<AdsBloc>().searchMode,
                                child: Icon(
                                  JumpetsIcons.filtra,
                                  color: context.bloc<AdsBloc>().searchMode
                                      ? Colors.white
                                      : Theme.of(context).accentColor,
                                ),
                                onTap: () => Helper.showFilterBottomSheet(
                                      context,
                                      category:
                                          context.bloc<AdsBloc>().category,
                                      text:
                                          context.bloc<AdsBloc>().filters?.text,
                                      activityLevel: context
                                          .bloc<AdsBloc>()
                                          .filters
                                          ?.activityLevel,
                                      deliveryInfo: context
                                          .bloc<AdsBloc>()
                                          .filters
                                          ?.deliveryInfo,
                                      male:
                                          context.bloc<AdsBloc>().filters?.male,
                                      size:
                                          context.bloc<AdsBloc>().filters?.size,
                                    ));
                          },
                        ),
                      )
                    ]..addAll(Category.values
                        .toList()
                        .map((category) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: CategoryButton.fromCategory(
                                isSelected: adsBloc.category == category,
                                category: category,
                                size: 50,
                                isCollapsed: true,
                                borderRadius: 10,
                                onTap: (category) => adsBloc
                                  ..add(CategorySelected(category: category))
                                  ..add(LastAdsRefreshed()),
                              ),
                            ))
                        .toList()),
                  ),
                ),
              ),
            ),
            _wrapperOfContent(adsBloc.category),
          ],
        ),
      ),
    );
  }

  Widget _title(adsBloc) => SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: BlocBuilder<AdsBloc, AdsState>(
                  buildWhen: (previous, current) => current is CategoryChanged,
                  builder: (context, state) {
                    return Text(
                        AppLocalizations.of(context)
                            .translate(adsBloc.category.name.toLowerCase()),
                        style: Theme.of(context).textTheme.headline3);
                  },
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.grey.shade500,
                  ),
                  onPressed: () {
                    if (context
                            .bloc<AuthBloc>()
                            .state
                            .authStatus
                            .status
                            ?.isAuthenticated ==
                        true) {
                      Navigator.pushNamed(context, '/upload_ad');
                    } else {
                      Helper.showLoginBottomSheet(context);
                    }
                  })
            ],
          ),
        ),
      );

  Widget _wrapperOfContent(Category category) {
    switch (category) {
      case Category.SHELTERS:
        return SliverFillRemaining(
          hasScrollBody: true,
          child: _contentOfCategory(),
        );
    }
    return SliverToBoxAdapter(
      child: _contentOfCategory(),
    );
  }

  Widget _contentOfCategory() {
    return BlocConsumer<AdsBloc, AdsState>(
      listenWhen: (previous, current) =>
          !_refreshCompleter.isCompleted &&
          previous is AdsLoading &&
          (current is AdsSuccess || current is AdsFailure),
      listener: (context, state) {
        _refreshCompleter?.complete();
        _refreshCompleter = Completer();
      },
      builder: (context, state) {
        if (state is AdsLoading || state is AdsSuccess) {
          switch (context.bloc<AdsBloc>().category) {
            case Category.SHELTERS:
              if (state is AdsSuccess && state.shelters.isEmpty)
                return EmptySpace();
              return SheltersGrid(
                shelters: (state is AdsSuccess) ? state.shelters : null,
                usePlaceholders: state is AdsLoading,
              );
            default:
              List<Ad> ads = [];
              if (state is AdsSuccess) {
                ads = context.bloc<AdsBloc>().searchMode
                    ? state.searchedAds
                    : state.paginatedAds.ads.asList();
              }

              if (state is AdsSuccess && ads.isEmpty) return EmptySpace();

              return VerticalGrid(
                widgetInjection: InfoCard(
                  title: 'PetsWorld',
                  message:
                      'Check our last update! This new version (2.2v) comes with 3 new functionalities.',
                ),
                ads: ads,
                usePlaceholders: state is AdsLoading,
              );
          }
        }
        if (state is AdsFailure) {
          // * Si category == shelters, ha fallado por falta de token

          return EmptySpace();
        }
        return FittedBox(
          child: Text('Initializing'),
        );
      },
    );
  }
}
