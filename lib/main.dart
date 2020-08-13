import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/bloc/ads_bloc.dart';
import 'package:jumpets_app/bloc/auth_bloc.dart';
import 'package:jumpets_app/bloc/bloc_delegate.dart';
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
        assert(authenticationRepository != null);
  final AdsRepository adsRepository;
  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      // TODO Quizas este widget sobra
      value: authenticationRepository,
      child: MultiBlocProvider(
          providers: [
            BlocProvider<AdsBloc>(
              create: (context) =>
                  AdsBloc(repository: adsRepository)..add(AdsFetched()),
            ),
            BlocProvider<AuthBloc>(
              create: (context) =>
                  AuthBloc(authenticationRepository: authenticationRepository),
            ),
          ],
          child: MaterialApp(
              title: 'Flutter Demo',
              theme: AppTheme.getTheme(),
              home: HomePage())),
    );
  }
}
