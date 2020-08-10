import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jumpets_app/data/repositories/ads_repository.dart';
import 'package:jumpets_app/models/enums/categories.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/models/wrappers/paginated_ads.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'ads_event.dart';
part 'ads_state.dart';

class AdsBloc extends Bloc<AdsEvent, AdsState> {
  final AdsRepository repository;
  AdsBloc({@required this.repository}) : super(AdsInitial());

  @override
  Stream<AdsState> mapEventToState(
    AdsEvent event,
  ) async* {
    if (event is AdsFetched && _hasNextPage) {
      try {
        if (state is AdsInitial) {
          final paginatedAds = await repository.getPaginatedAds(
            category: state.category,
            first: 10,
            after: null,
            photosWidth: event.photosWidth,
            photosHeight: event.photosHeight,
            thumbnailHeight: event.thumbnailHeight,
            thumbnailWidth: event.thumbnailWidth,
          );
          yield AdsSuccess(paginatedAds: paginatedAds);
        } else if (state is AdsSuccess) {
          final paginatedAds = await repository.getPaginatedAds(
            category: state.category,
            first: 10,
            after: (state as AdsSuccess).paginatedAds.pageInfo.endCursor,
            photosWidth: event.photosWidth,
            photosHeight: event.photosHeight,
            thumbnailHeight: event.thumbnailHeight,
            thumbnailWidth: event.thumbnailWidth,
          );
          yield AdsSuccess(
              paginatedAds: paginatedAds.rebuild((b) => b
                ..ads = BuiltList<Ad>([]
                      ..addAll((state as AdsSuccess).paginatedAds.ads)
                      ..addAll(paginatedAds.ads))
                    .toBuilder()));
        }
      } catch (_) {
        yield AdsFailure();
      }
    }

    if (event is CategorySelected) {
      if (state is AdsInitial) {
        yield AdsInitial(category: event.category);
      }
    }
  }

  @override
  Stream<Transition<AdsEvent, AdsState>> transformEvents(
      Stream<AdsEvent> events,
      TransitionFunction<AdsEvent, AdsState> transitionFn) {
    return super.transformEvents(
        events.debounceTime(const Duration(milliseconds: 500)), transitionFn);
  }

  bool get _hasNextPage =>
      state is AdsSuccess &&
      (state as AdsSuccess).paginatedAds.pageInfo.hasNextPage;
}
