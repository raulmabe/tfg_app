import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumpets_app/bloc/ads_bloc.dart';
import 'package:jumpets_app/bloc/bloc_delegate.dart';
import 'package:jumpets_app/data/repositories/ads_repository.dart';
import 'package:jumpets_app/ui/app_theme.dart';
import 'package:jumpets_app/ui/home_page/home_page.dart';

void main() {
  Bloc.observer = BlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.getTheme(),
      home: BlocProvider(
        create: (context) => AdsBloc(repository: AdsRepository())
          ..add(AdsFetched(
              photosWidth: MediaQuery.of(context).size.width.toInt(),
              photosHeight: 200,
              thumbnailHeight: 50,
              thumbnailWidth: 50)),
        child: HomePage(),
      ),
    );
  }
}
