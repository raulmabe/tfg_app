import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/bloc/ads_bloc.dart';
import 'package:jumpets_app/models/enums/categories.dart';
import 'package:jumpets_app/ui/components/category_button.dart';
import 'package:jumpets_app/ui/components/info_card.dart';
import 'package:jumpets_app/ui/components/jumpets_icons_icons.dart';
import 'package:jumpets_app/ui/components/vertical_grid/vertical_grid.dart';

class MainPage extends StatelessWidget {
  final ScrollController scrollController;

  MainPage({this.scrollController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdsBloc, AdsState>(
      builder: (context, state) {
        if (state is AdsSuccess) {
          return _buildBody(context, state.category, state.paginatedAds.ads);
        }
        return _buildBody(context, state.category, []);
      },
    );
  }

  _buildBody(context, category, ads) {
    return ListView(
      controller: scrollController,
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(category.name.capitalize(),
                    style: Theme.of(context).textTheme.display2),
              ),
              IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.grey.shade500,
                  ),
                  onPressed: () => print('add'))
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 20),
                  child: RoundedSquareButton(
                      size: 50,
                      borderRadius: 10,
                      isSelected: false,
                      child: Icon(
                        JumpetsIcons.filtra,
                        color: Theme.of(context).accentColor,
                      ),
                      onTap: () => print('filtra')),
                )
              ]..addAll(Category.values
                  .toList()
                  .map((category2) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CategoryButton.fromCategory(
                          isSelected: category == category2,
                          category: category2,
                          size: 50,
                          isCollapsed: true,
                          borderRadius: 10,
                          onTap: (category) => BlocProvider.of<AdsBloc>(context)
                            ..add(CategorySelected(category: category))
                            ..add(AdsFetched()),
                        ),
                      ))
                  .toList()),
            ),
          ),
        ),
        Divider(),
        ads.length > 0
            ? VerticalGrid(
                widgetInjection: InfoCard(
                  title: 'Jumpets',
                  message:
                      'Check our last update! This new version (2.2v) comes with 3 new functionalities.',
                ),
                ads: ads,
              )
            : CircularProgressIndicator(),
      ],
    );
  }
}
