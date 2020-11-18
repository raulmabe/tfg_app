import 'package:bloc_test/bloc_test.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:jumpets_app/blocs/favs_bloc/favourites_bloc.dart';
import 'package:jumpets_app/blocs/info_handler_bloc/info_handler_bloc.dart';
import 'package:jumpets_app/data/repositories/ads_repository.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import './auth_bloc_test.dart';

class MockAdRepository extends Mock implements AdsRepository {
}

void main(){

  group('Favourites Bloc',(){
    FavouritesBloc favsBloc;
    MockAdRepository adsRepository;

    Ad ad;

    setUp(() {
      ad = Ad.fromJson({
              'id': 'id',
              'createdAt': DateTime.now().toString(),
              'type':'PRODUCTAD',
              'tags': ['de','de'],
              'title':'d',
              'description':'d',
              'price':35,
              'photos': ['d','d'],
              'creator': {
                'id':'id',
                'type': 'Particular',
                'name':'Mabe',
                'email':'email',
                'password':'password',
                'createdAt':DateTime.now().toIso8601String(),
                'updatedAt':DateTime.now().toIso8601String()
              },
            });

      adsRepository = MockAdRepository();

      favsBloc = FavouritesBloc(authBloc: AuthBloc(
        authenticationRepository: MockAuthenticationRepository(),
        infoBloc: InfoHandlerBloc(),
        errorBloc: ErrorHandlerBloc(),
      ), errorBloc: ErrorHandlerBloc(), repository: adsRepository);
    });
    
    test('Initial state of Favourites bloc is initial', () {
      expect(favsBloc.state, isA<FavouritesInitial>());
    });

    blocTest(
    'Favourites bloc reinitialize itself when FavouriteInitialized event is added',
    build: () => favsBloc,
    act: (bloc) async => bloc.add(FavouriteInitialized()),
    expect: [isA<FavouritesInitial>()],); 



    blocTest(
    'emits [Loading, Success] when ad is added to the bloc',
    build: () {
      when(adsRepository.saveAd(token: anyNamed('token'), id: 'id')).thenAnswer((_) async => <Ad>[]);
      return favsBloc;
    },
    act: (bloc) async => bloc.add(FavouriteAdAdded(ad: ad)),
    expect: [FavouritesLoading(),FavouritesSuccess(ads: List.from([]))],); 




  });

  

}