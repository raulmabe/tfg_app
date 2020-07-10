import 'package:flutter/material.dart';
import 'package:jumpets_app/models/enums/categories.dart';
import 'package:jumpets_app/ui/components/category_button.dart';
import 'package:jumpets_app/ui/components/info_card.dart';
import 'package:jumpets_app/ui/components/jumpets_icons_icons.dart';
import 'package:jumpets_app/ui/components/vertical_grid/vertical_grid.dart';
import 'package:jumpets_app/ui/home_page/pages/main_page_vm.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:jumpets_app/models/extensions/string_extension.dart';

class MainPage extends StatelessWidget {
  final MainPageViewModel viewModel;
  final ScrollController scrollController;

  MainPage({@required this.viewModel, this.scrollController});

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      showChildOpacityTransition: false,
      onRefresh: viewModel.onRefreshAnimalAds,
      child: ListView(
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
                  child: Text(viewModel.category.name.capitalize(),
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
                          child: CategoryButtonBuilder.fromCategory(
                            isSelected: viewModel.category == category,
                            category: category,
                            size: 50,
                            isCollapsed: true,
                            borderRadius: 10,
                          ),
                        ))
                    .toList()),
              ),
            ),
          ),
          Divider(),
          VerticalGrid(
            widgetInjection: InfoCard(
              title: 'Jumpets',
              message:
                  'Check our last update! This new version (2.2v) comes with 3 new functionalities.',
            ),
            ads: viewModel.animalAds,
          ),
        ],
      ),
    );
  }
}
