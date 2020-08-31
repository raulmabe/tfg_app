import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jumpets_app/blocs/ads_bloc/ads_bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/models/wrappers/auth_status.dart';
import 'package:jumpets_app/ui/components/bottombar/bottombar.dart';
import 'package:jumpets_app/ui/components/error_notifier.dart';
import 'package:jumpets_app/ui/components/profile_icon.dart';
import 'package:jumpets_app/ui/components/searchbar/searchbar.dart';
import 'package:jumpets_app/ui/home_page/page_view.dart';

class HomePage extends StatefulWidget {
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
    if (maxScroll - currentScroll <= _scrollThreshold &&
        !context.bloc<AdsBloc>().searchMode) {
      context.bloc<AdsBloc>().add(MoreAdsFetched());
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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        title: BlocBuilder<AdsBloc, AdsState>(
          buildWhen: (prev, current) => current is CategoryChanged,
          builder: (context, state) {
            return OpenableSearchBar(
              blocked: !context.bloc<AdsBloc>().isCategoryValidToSearch,
            );
          },
        ),
        actions: <Widget>[
          BlocBuilder<AuthBloc, AuthState>(
            buildWhen: (previous, current) =>
                previous.authStatus != current.authStatus,
            builder: (context, state) {
              if (state.authStatus.status !=
                  AuthenticationStatus.authenticated) {
                return IconButton(
                    icon: Icon(FontAwesomeIcons.slidersH),
                    iconSize: 22,
                    onPressed: () => Navigator.pushNamed(context, '/settings'),
                    color: Colors.black54);
              }
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CircularProfileThumb(
                    onTap: () => Navigator.pushNamed(context, '/profile',
                        arguments: state.authStatus.authData.user),
                    borderWidth: 2,
                    user: state.authStatus.authData.user,
                  ));
            },
          ),
        ],
      ),
      body: ErrorNotifier(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(32))),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: HomePageView(
                    pageController: _pageController,
                    scrollController: _scrollController,
                  )),
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
      ),
    );
  }
}
