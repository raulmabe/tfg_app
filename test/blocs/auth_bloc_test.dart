
import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/bloc/login_bloc.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:jumpets_app/blocs/info_handler_bloc/info_handler_bloc.dart';
import 'package:jumpets_app/data/repositories/authentication_repository.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/models/wrappers/auth_data.dart';
import 'package:jumpets_app/models/wrappers/auth_status.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockUser extends Mock implements User{}

class MockAuthData extends Mock implements AuthData{}

class MockAuthenticationRepository extends Mock implements AuthenticationRepository {
  final _controller = StreamController<AuthStatus>();
  
  Stream<AuthStatus> get status async* {

    yield AuthStatus.unknown();
    yield* _controller.stream;
  }


  Future<AuthData> logIn({
    @required String email,
    @required String password,
  }) async {
    assert(email != null);
    assert(password != null);

    AuthData auth = AuthData.fromJson({
      'user': {
        'id':'id',
        'type': 'Particular',
        'name':'Mabe',
        'email':email,
        'password':password,
        'createdAt':DateTime.now().toIso8601String(),
        'updatedAt':DateTime.now().toIso8601String()
      },
      'token':'token',
      'tokenExpiration':1
    });

    _controller.add(AuthStatus.authenticated(auth));
    return auth;
  }
  
}

void main(){

  group('AuthBloc && LoginBloc',(){
    LoginBloc loginBloc;
    AuthBloc authBloc;

    MockAuthenticationRepository authenticationRepository ;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();

      authBloc = AuthBloc(
        authenticationRepository: authenticationRepository,
        infoBloc: InfoHandlerBloc(),
        errorBloc: ErrorHandlerBloc(),
      );

      loginBloc = LoginBloc(authenticationRepository: authenticationRepository, errorBloc: ErrorHandlerBloc());
    });
    
    test('Initial state of authBloc is unknown', () {
      expect(authBloc.state.authStatus.status, AuthStatus.unknown().status );
    });


    test('Initial state of LoginBloc is pure', () {
      expect(loginBloc.state.status, FormzStatus.pure );
    });

    blocTest(
    'loginBloc emits an updated state when a user inserts its email',
    build: () => loginBloc,
    act: (bloc) async => loginBloc..add(LoginEmailChanged('mabe@mabe.com')),
    expect: [
      LoginState().copyWith(email: Email.dirty('mabe@mabe.com'), status: FormzStatus.invalid),
      ]);


    blocTest(
    'loginBloc emits an updated state when a user inserts its password',
    build: () => loginBloc,
    seed:LoginState().copyWith(email: Email.dirty('mabe@mabe.com'), status: FormzStatus.invalid),
    act: (bloc) async => loginBloc.add(LoginPasswordChanged('password')),
    expect: [
     LoginState().copyWith(email: Email.dirty('mabe@mabe.com'), status: FormzStatus.invalid).copyWith(password: Password.dirty('password'), status: FormzStatus.valid)
      ]);

    blocTest(
    'loginBloc emits a submissionSuccess status when a user logs in',
    build: () => loginBloc,
    seed: LoginState().copyWith(email: Email.dirty('mabe@mabe.com'), status: FormzStatus.invalid).copyWith(password: Password.dirty('password'), status: FormzStatus.valid),
    act: (bloc) async => loginBloc.add(LoginLogInSubmitted()),
    expect: [
      LoginState().copyWith(email: Email.dirty('mabe@mabe.com'), status: FormzStatus.invalid).copyWith(password: Password.dirty('password')).copyWith(status: FormzStatus.submissionInProgress),
      LoginState().copyWith(email: Email.dirty('mabe@mabe.com'), status: FormzStatus.invalid).copyWith(password: Password.dirty('password')).copyWith(status: FormzStatus.submissionSuccess)]);
      

    blocTest(
    'authBloc emits updated status when a user logs in the system',
    build: () => authBloc,
    act: (bloc) async => authenticationRepository.logIn(email: 'mabe@mabe.com', password: 'password'),
    expect: [AuthState(),AuthState(authStatus: AuthStatus.authenticated(AuthData.fromJson({
      'user': {
        'id':'id',
        'type': 'Particular',
        'name':'Mabe',
        'email':'mabe@mabe.com',
        'password':'password',
        'createdAt':DateTime.now().toIso8601String(),
        'updatedAt':DateTime.now().toIso8601String()
      },
      'token':'token',
      'tokenExpiration':1
    })))],
); 
  });

}