import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jumpets_app/data/repositories/ads_repository.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:meta/meta.dart';

part 'search_ads_event.dart';
part 'search_ads_state.dart';

class SearchAdsBloc extends Bloc<SearchAdsEvent, SearchAdsState> {
  final AdsRepository repository;
  SearchAdsBloc({@required this.repository})
      : assert(repository != null),
        super(SearchAdsInitial());

  @override
  Stream<SearchAdsState> mapEventToState(
    SearchAdsEvent event,
  ) async* {
    switch (event.runtimeType) {
      case AdsSearched:
        try {
          yield SearchAdsLoading();
          List<Ad> ads = await repository.searchAds(
              activityLevel: (event as AdsSearched).activityLevel,
              male: (event as AdsSearched).male,
              creator: (event as AdsSearched).creator,
              size: (event as AdsSearched).size,
              text: (event as AdsSearched).text,
              deliveryInfo: (event as AdsSearched).deliveryInfo,
              type: (event as AdsSearched).type);

          yield SearchAdsSuccess(ads: ads);
        } catch (err, stack) {
          print('OnCatch $err, $stack');
          yield SearchAdsFailure();
        }
        break;
      default:
    }
  }
}
