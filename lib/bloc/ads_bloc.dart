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
  String _currentEndCursor;
  Category category;

  AdsBloc({@required this.repository, this.category = Category.DOGS})
      : super(AdsInitial());

  @override
  void onTransition(Transition<AdsEvent, AdsState> transition) {
    super.onTransition(transition);
    if (transition.event is CategorySelected) {
      category = (transition.event as CategorySelected).category;
    }

    if (transition.nextState is AdsSuccess) {
      _currentEndCursor =
          (transition.nextState as AdsSuccess).paginatedAds.pageInfo.endCursor;
    }
  }

  @override
  Stream<AdsState> mapEventToState(
    AdsEvent event,
  ) async* {
    switch (event.runtimeType) {
      case AdsFetched:
        yield AdsLoading();
        yield await _mapAdsFetchedToState(event);
        break;
      case MoreAdsFetched:
        yield AdsLoading();
        yield await _mapMoreAdsFetchedToState(event);
        break;
      default:
        break;
    }
  }

  Future<AdsState> _mapMoreAdsFetchedToState(MoreAdsFetched event) async {
    try {
      final paginatedAds = await repository.getPaginatedAds(
        category: category,
        first: 10,
        after: _currentEndCursor,
        photosWidth: event.photosWidth,
        photosHeight: event.photosHeight,
        thumbnailHeight: event.thumbnailHeight,
        thumbnailWidth: event.thumbnailWidth,
      );
      return AdsSuccess(
          paginatedAds: paginatedAds.rebuild((b) => b
            ..ads = BuiltList<Ad>([]
                  ..addAll((state as AdsSuccess).paginatedAds.ads)
                  ..addAll(paginatedAds.ads))
                .toBuilder()));
    } catch (err, stacktrace) {
      print('Ads BLoC OnCatch $err, $stacktrace');
      return AdsFailure();
    }
  }

  Future<AdsState> _mapAdsFetchedToState(AdsFetched event) async {
    try {
      final paginatedAds = await repository.getPaginatedAds(
        category: category,
        first: 10,
        after: null,
        photosWidth: event.photosWidth,
        photosHeight: event.photosHeight,
        thumbnailHeight: event.thumbnailHeight,
        thumbnailWidth: event.thumbnailWidth,
      );
      return AdsSuccess(paginatedAds: paginatedAds);
    } catch (err, stacktrace) {
      print('Ads BLoC OnCatch $err, $stacktrace');
      return AdsFailure();
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
