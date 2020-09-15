import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:jumpets_app/blocs/ads_bloc/ads_bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/bloc_delegate.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:jumpets_app/blocs/favs_bloc/favourites_bloc.dart';
import 'package:jumpets_app/blocs/info_handler_bloc/info_handler_bloc.dart';
import 'package:jumpets_app/blocs/locale_bloc/locale_bloc.dart';
import 'package:jumpets_app/blocs/rooms_bloc/rooms_bloc.dart';
import 'package:jumpets_app/blocs/search_bloc/search_ads_bloc.dart';
import 'package:jumpets_app/data/repositories/ads_repository.dart';
import 'package:jumpets_app/data/repositories/authentication_repository.dart';
import 'package:jumpets_app/data/repositories/user_repository.dart';
import 'package:jumpets_app/models/wrappers/auth_status.dart';
import 'package:jumpets_app/route_generator.dart';
import 'package:jumpets_app/ui/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';

void main() async {
  Bloc.observer = BlocDelegate();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await DotEnv().load('.env');
  await initHiveForFlutter();

  runApp(MyApp(
    adsRepository: AdsRepository(),
    authenticationRepository: AuthenticationRepository(),
    userRepository: UserRepository(),
    errorBloc: ErrorHandlerBloc(),
    infoBloc: InfoHandlerBloc(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp(
      {@required this.adsRepository,
      @required this.authenticationRepository,
      @required this.userRepository,
      @required this.errorBloc,
      @required this.infoBloc})
      : assert(authenticationRepository != null),
        assert(userRepository != null),
        assert(adsRepository != null),
        assert(errorBloc != null),
        authBloc = AuthBloc(
          authenticationRepository: authenticationRepository,
          errorBloc: errorBloc,
          infoBloc: infoBloc,
        ),
        localeBloc = LocaleBloc('en');

  final AuthBloc authBloc;
  final ErrorHandlerBloc errorBloc;
  final InfoHandlerBloc infoBloc;
  final LocaleBloc localeBloc;
  final AdsRepository adsRepository;
  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: RepositoryProvider.value(
        value: userRepository,
        child: RepositoryProvider.value(
          value: adsRepository,
          child: MultiBlocProvider(
            providers: [
              BlocProvider<RoomsBloc>(
                  create: (context) => RoomsBloc(
                      repository: userRepository,
                      authBloc: authBloc,
                      errorBloc: errorBloc)),
              BlocProvider<InfoHandlerBloc>(
                create: (context) => infoBloc,
              ),
              BlocProvider<ErrorHandlerBloc>(
                create: (context) => errorBloc,
              ),
              BlocProvider<LocaleBloc>(
                create: (context) => localeBloc,
              ),
              BlocProvider<AdsBloc>(
                create: (context) => AdsBloc(
                    repository: adsRepository,
                    authBloc: authBloc,
                    errorBloc: errorBloc)
                  ..add(AdsFetched()),
              ),
              BlocProvider<AuthBloc>(
                create: (context) => authBloc,
              ),
              BlocProvider<FavouritesBloc>(
                  create: (context) => FavouritesBloc(
                      repository: adsRepository,
                      authBloc: authBloc,
                      errorBloc: errorBloc)),
              BlocProvider<SearchAdsBloc>(
                create: (context) => SearchAdsBloc(
                    repository: adsRepository, errorBloc: errorBloc),
              ),
            ],
            // * Listener for when the users log in
            child: BlocListener<AuthBloc, AuthState>(
              listenWhen: (previous, current) =>
                  previous.authStatus.status !=
                      AuthenticationStatus.authenticated &&
                  current.authStatus.status ==
                      AuthenticationStatus.authenticated,
              listener: (context, state) {
                context.bloc<FavouritesBloc>().add(FavouritesFetched());
                context.bloc<RoomsBloc>().add(RoomsFetched());
              },
              child: BlocBuilder<LocaleBloc, LocaleState>(
                builder: (context, state) {
                  return OverlaySupport(
                    child: MaterialApp(
                      locale: Locale(state.code),
                      title: 'PetsWorld',
                      theme: AppTheme.getTheme(),
                      onGenerateRoute: RouteGenerator.generateRoute,
                      initialRoute: '/',
                      supportedLocales: [
                        const Locale('en', 'US'),
                        const Locale('es', 'ES'),
                        const Locale('ca', 'CA'),
                      ],
                      localizationsDelegates: [
                        AppLocalizations.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate
                      ],
                      localeResolutionCallback: (locale, supportedLocales) {
                        for (var supportedLocale in supportedLocales) {
                          if (supportedLocale.languageCode ==
                              locale.languageCode) {
                            return supportedLocale;
                          }
                        }
                        return supportedLocales.first;
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
