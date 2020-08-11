import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/bloc/ads_bloc.dart';
import 'package:jumpets_app/models/enums/categories.dart';
import 'package:jumpets_app/ui/components/category_button.dart';
import 'package:jumpets_app/ui/components/info_card.dart';
import 'package:jumpets_app/ui/components/jumpets_icons_icons.dart';
import 'package:jumpets_app/ui/components/vertical_grid/vertical_grid.dart';
import 'package:jumpets_app/models/models.dart';

class MainPage extends StatelessWidget {
  final ScrollController scrollController;

  MainPage({this.scrollController});

  @override
  Widget build(BuildContext context) {
    var adsBloc = BlocProvider.of<AdsBloc>(context);
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
                child: Text(adsBloc.category.name.capitalize(),
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
                  .map((category) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CategoryButton.fromCategory(
                          isSelected: adsBloc.category == category,
                          category: category,
                          size: 50,
                          isCollapsed: true,
                          borderRadius: 10,
                          onTap: (category) {
                            adsBloc
                              ..add(CategorySelected(category: category))
                              ..add(AdsFetched());
                          },
                        ),
                      ))
                  .toList()),
            ),
          ),
        ),
        Divider(),
        BlocBuilder<AdsBloc, AdsState>(
          builder: (context, state) {
            if (state is AdsLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is AdsSuccess) {
              return VerticalGrid(
                widgetInjection: InfoCard(
                  title: 'Jumpets',
                  message:
                      'Check our last update! This new version (2.2v) comes with 3 new functionalities.',
                ),
                ads: state.paginatedAds.ads.asList(),
              );
            }
            if (state is AdsFailure) {
              return FittedBox(
                child: Text('Error'),
              );
            }
            return FittedBox(
              child: Text('Initializing'),
            );
          },
        ),
      ],
    );
  }
}
