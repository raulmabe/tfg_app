import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/models/wrappers/auth_status.dart';
import 'package:jumpets_app/ui/components/auth/auth_sheet.dart';
import 'package:jumpets_app/ui/helper.dart';
import 'package:jumpets_app/ui/home_page/pages/favourites_page.dart';
import 'package:jumpets_app/ui/home_page/pages/main_page.dart';

class HomePageView extends StatelessWidget {
  final PageController pageController;
  final ScrollController scrollController;

  HomePageView(
      {@required this.pageController, @required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state.authStatus.status !=
                  AuthenticationStatus.authenticated) {
                return AuthBody(
                  isFlex: true,
                );
              } else {
                return FavouritesPage();
              }
            },
          ),
          MainPage(
            scrollController: scrollController,
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state.authStatus.status !=
                  AuthenticationStatus.authenticated) {
                return AuthBody(
                  isFlex: true,
                );
              } else {
                return Container(color: Colors.tealAccent);
              }
            },
          ),
        ]);
  }
}
