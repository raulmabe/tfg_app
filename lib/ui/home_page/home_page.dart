import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/ads_bloc/ads_bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/models/wrappers/auth_status.dart';
import 'package:jumpets_app/ui/components/animated_gradient_icon.dart';
import 'package:jumpets_app/ui/components/bottombar/bottombar.dart';
import 'package:jumpets_app/ui/components/jumpets_icons_icons.dart';
import 'package:jumpets_app/ui/components/listeners/notifier.dart';
import 'package:jumpets_app/ui/components/profile_icon.dart';
import 'package:jumpets_app/ui/components/searchbar/searchbar.dart';
import 'package:jumpets_app/ui/home_page/page_view.dart';
import 'package:jumpets_app/blocs/info_handler_bloc/info_handler_bloc.dart';

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
    return WillPopScope(
      onWillPop: () {
        context.bloc<InfoHandlerBloc>().add(MessageActionAdded(
              msg: 'are_you_sure_you_want_to_exit_the_app',
              onSecondaryCallback: () =>
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
              onSecondaryText: 'yes',
              onMainText: 'cancel',
              onMainCallback: () {},
            ));
        return Future.value(false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
          title: BlocBuilder<AdsBloc, AdsState>(
            buildWhen: (prev, current) => current is CategoryChanged,
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 0),
                    child: _getAppBarHeader),
              );
            },
          ),
        ),
        body: Notifier(
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
              /* if (MediaQuery.of(context).viewInsets.bottom == 0)
                Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: FloatingBottomBar(
                      onTap: (int index) => _pageController.jumpToPage(
                        index,
                      ),
                      onDoubleMainTap: () => _scrollController.animateTo(0,
                          duration: Duration(milliseconds: 600),
                          curve: Curves.bounceIn),
                      pageSelected: _pageIndex,
                    )) */
            ],
          ),
        ),
        floatingActionButton: MaterialGradient(
          offColors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor
          ],
          shape: CircleBorder(),
          elevation: 1,
          isColored: _pageIndex == 1,
          child: FloatingActionButton(
            heroTag: null,
            focusElevation: 0,
            highlightElevation: 0,
            elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            child: Transform.translate(
                offset: Offset(0, 0),
                child: AnimatedGradientIcon(
                  JumpetsIcons.nariz_jumpets,
                  size: 31,
                  isSelected: _pageIndex == 1,
                  offColors: [
                    Theme.of(context).iconTheme.color,
                    Theme.of(context).iconTheme.color,
                  ],
                  onColors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor
                  ],
                )),
            onPressed: () => _pageController.jumpToPage(
              1,
            ),
          ),
        ),
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomBar(
          elevation: 10,
          pageSelected: _pageIndex,
          onTap: (int index) => _pageController.jumpToPage(
            index,
          ),
        ),
      ),
    );
  }

  Widget get _getAppBarHeader {
    if (_pageIndex == 0) {
      return _title(
        Text(
          AppLocalizations.of(context).translate('favourites'),
          style: Theme.of(context).textTheme.headline3,
        ),
      );
    } else if (_pageIndex == 1) {
      return _title(
        SearchBar(
          onChange: (value) => context.bloc<AdsBloc>().add(AdsSearched(
                text: value.trim(),
              )),
          onClear: () => context.bloc<AdsBloc>()
            ..add(SearchModeDisabled())
            ..add(AdsFetched()),
        ),
      );
    } else if (_pageIndex == 2) {
      return _title(Text(
        AppLocalizations.of(context).translate('chats'),
        style: Theme.of(context).textTheme.headline3,
      ));
    }

    return _title(
      SearchBar(
        onChange: (value) => context.bloc<AdsBloc>().add(AdsSearched(
              text: value.trim(),
            )),
        onClear: () => context.bloc<AdsBloc>()
          ..add(SearchModeDisabled())
          ..add(AdsFetched()),
      ),
    );
  }

  Widget _title(Widget main) => Builder(builder: (context) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(child: main),
            BlocBuilder<AuthBloc, AuthState>(
              buildWhen: (previous, current) =>
                  previous.authStatus != current.authStatus,
              builder: (context, state) {
                if (state.authStatus.status !=
                    AuthenticationStatus.authenticated) {
                  return IconButton(
                    icon: Icon(Icons.menu),
                    iconSize: 24,
                    onPressed: () => Navigator.pushNamed(context, '/settings'),
                  );
                }
                return Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: CircularProfileThumb(
                      onTap: () => Navigator.pushNamed(context, '/profile',
                          arguments: state.authStatus.authData.user),
                      borderWidth: 2,
                      user: state.authStatus.authData.user,
                    ));
              },
            ),
          ],
        );
      });
}
