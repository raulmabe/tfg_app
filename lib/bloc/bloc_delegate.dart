import 'package:flutter_bloc/flutter_bloc.dart';

class BlocDelegate extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('$transition on $bloc');
    super.onTransition(bloc, transition);
  }
}
