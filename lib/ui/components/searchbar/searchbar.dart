import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/ads_bloc/ads_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/ui/filters_page/filters_page.dart';
import 'package:jumpets_app/ui/helper.dart';

class OpenableSearchBar extends StatelessWidget {
  final bool blocked;
  OpenableSearchBar({this.blocked = false});

  @override
  Widget build(BuildContext context) {
    if (blocked)
      return Material(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          color: Theme.of(context).backgroundColor,
          elevation: 0,
          child: SearchBar(blocked: blocked));

    return OpenContainer(
        closedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        closedColor: Theme.of(context).backgroundColor,
        closedElevation: 0,
        openBuilder: (context, action) => FiltersPage(
              category: context.bloc<AdsBloc>().category,
              text: context.bloc<AdsBloc>().filters?.text,
              activityLevel: context.bloc<AdsBloc>().filters?.activityLevel,
              deliveryInfo: context.bloc<AdsBloc>().filters?.deliveryInfo,
              male: context.bloc<AdsBloc>().filters?.male,
              size: context.bloc<AdsBloc>().filters?.size,
              focused: true,
            ),
        closedBuilder: (context, action) => SearchBar());
  }
}

class SearchBar extends StatelessWidget {
  final bool blocked;
  SearchBar({this.blocked = false});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdsBloc, AdsState>(
        buildWhen: (prev, current) => current is SearchModeChanged,
        builder: (context, state) {
          return Row(children: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.grey.shade800,
              ),
              onPressed: () => print('search'),
            ),
            Expanded(
              child: IgnorePointer(
                child: TextField(
                    decoration:
                        InputDecoration.collapsed(hintText: text(context))),
              ),
            ),
            context.bloc<AdsBloc>().searchMode
                ? IconButton(
                    color: Colors.black87,
                    icon: Icon(Icons.clear),
                    onPressed: () => context.bloc<AdsBloc>()
                      ..add(SearchModeDisabled())
                      ..add(AdsFetched()))
                : Container()
          ]);
        });
  }

  String text(BuildContext context) {
    if (blocked)
      return AppLocalizations.of(context).translate('search_disabled');
    return context.bloc<AdsBloc>().searchMode
        ? Helper.getFiltersStringFromEvent(
            context, context.bloc<AdsBloc>().filters)
        : AppLocalizations.of(context).translate('search_bar_hint_text');
  }
}
