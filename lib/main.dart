import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/blocs/ads_bloc/ads_bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/bloc_delegate.dart';
import 'package:jumpets_app/blocs/favs_bloc/favourites_bloc.dart';
import 'package:jumpets_app/blocs/search_bloc/search_ads_bloc.dart';
import 'package:jumpets_app/data/repositories/ads_repository.dart';
import 'package:jumpets_app/data/repositories/authentication_repository.dart';
import 'package:jumpets_app/ui/app_theme.dart';
import 'package:jumpets_app/ui/home_page/home_page.dart';

void main() {
  Bloc.observer = BlocDelegate();
  runApp(MyApp(
    adsRepository: AdsRepository(),
    authenticationRepository: AuthenticationRepository(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({@required this.adsRepository, @required this.authenticationRepository})
      : assert(authenticationRepository != null),
        assert(authenticationRepository != null),
        authBloc = AuthBloc(authenticationRepository: authenticationRepository);
  final AuthBloc authBloc;
  final AdsRepository adsRepository;
  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: RepositoryProvider.value(
        value: adsRepository,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AdsBloc>(
              create: (context) =>
                  AdsBloc(repository: adsRepository)..add(AdsFetched()),
            ),
            BlocProvider<AuthBloc>(
              create: (context) => authBloc,
            ),
            BlocProvider<FavouritesBloc>(
                create: (context) => FavouritesBloc(
                    repository: adsRepository, authBloc: authBloc)),
            BlocProvider<SearchAdsBloc>(
              create: (context) => SearchAdsBloc(repository: adsRepository),
            ),
          ],
          child: MaterialApp(
              title: 'Flutter Demo',
              theme: AppTheme.getTheme(),
              home: HomePage()),
        ),
      ),
    );
  }
}
