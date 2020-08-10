import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/bloc/ads_bloc.dart';
import 'package:jumpets_app/data/repositories/ads_repository.dart';
import 'package:jumpets_app/ui/components/bottombar/bottombar.dart';
import 'package:jumpets_app/ui/components/profile_icon.dart';
import 'package:jumpets_app/ui/components/searchbar/searchbar.dart';
import 'package:jumpets_app/ui/home_page/pages/favourites_page.dart';
import 'package:jumpets_app/ui/home_page/pages/main_page.dart';

class HomePage extends StatefulWidget {
  HomePage();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  ScrollController _scrollController;
  final _scrollThreshold = 200.0;
  int _pageIndex;

  @override
  void initState() {
    super.initState();
    _pageIndex = 1;

    _pageController = PageController(
      initialPage: _pageIndex,
    );
    _pageController.addListener(
        () => setState(() => _pageIndex = _pageController.page.toInt()));

    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      BlocProvider.of<AdsBloc>(context).add(AdsFetched());
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: SearchBar(),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ProfileIcon(
                withBorder: true,
                url:
                    'https://pbs.twimg.com/profile_images/977547096244047872/6x1ugfRC_400x400.jpg',
              )),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: [
                    FavouritesPage(),
                    MainPage(
                      scrollController: _scrollController,
                    ),
                    Container(color: Colors.tealAccent),
                  ]),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: BottomBar(
                onTap: (int index) => _pageController.jumpToPage(
                  index,
                ),
                onDoubleMainTap: () => _scrollController.animateTo(0,
                    duration: Duration(milliseconds: 600),
                    curve: Curves.bounceIn),
                pageSelected: _pageIndex,
              ))
        ],
      ),
    );
  }
}
