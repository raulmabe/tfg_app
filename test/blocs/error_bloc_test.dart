
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

void main (){
  group('ErrorBloc', (){
    ErrorHandlerBloc errorBloc;

    setUp(() {
      errorBloc = ErrorHandlerBloc();
    });
    
    test('Initial state is empty state', () {
      expect(errorBloc.state,  isA<ErrorHandlerEmpty>());
    });

    blocTest(
    'emits notification error when ErrorCatched with notification set true is added, and then clears itself',
    build: () => errorBloc,
    act: (bloc)async => bloc.add(ErrorHandlerCatched(bloc: null, error: new Error(),event: null, notification: true)),
    expect: [isA<ErrorThrownNotification>(),isA<ErrorHandlerEmpty>(),],
);


    blocTest(
    'emits dialog error when ErrorCatched with notification set false is added, and then clears itself',
    build: () => errorBloc,
    act: (bloc)async => bloc.add(ErrorHandlerCatched(bloc: null, error: new Error(),event: null, notification: false)),
    expect: [isA<ErrorThrownDialog>(),isA<ErrorHandlerEmpty>(),],
);
  });
}