

import 'package:jumpets_app/blocs/info_handler_bloc/info_handler_bloc.dart';
import 'package:jumpets_app/models/chats/message.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

void main (){
  group('InfoBloc', (){
    InfoHandlerBloc infoBloc;

    setUp(() {
      infoBloc = InfoHandlerBloc();
    });
    
    test('Initial state is empty state', () {
      expect(infoBloc.state,  isA<InfoHandlerEmpty>());
    });

    blocTest(
    'emits notification when MessageAdded with notification set true is added, and then clears itself',
    build: () => infoBloc,
    act: (bloc)async => bloc.add(MessageAdded(msg:'Info msg', notification: true)),
    expect: [isA<InfoNotification>(),isA<InfoHandlerEmpty>(),],
);


    blocTest(
    'emits dialog when MessageAdded with notification set false is added, and then clears itself',
    build: () => infoBloc,
    act: (bloc)async => bloc.add(MessageAdded(msg:'Info msg', notification: false)),
    expect: [isA<InfoDialog>(),isA<InfoHandlerEmpty>(),],
);

    blocTest(
    'emits dialog action when MessageActionAdded with notification set false is added',
    build: () => infoBloc,
    act: (bloc)async => bloc.add(MessageActionAdded(msg:'Info msg')),
    expect: [isA<InfoDialogAction>()],
);


    blocTest(
    'emits dialog action when MessageActionAdded with notification set false is added',
    build: () => infoBloc,
    act: (bloc)async => bloc.add(ChatMessageReceived(msg: null,roomId: '' )),
    expect: [isA<ChatMessage>()],
);



  });
}