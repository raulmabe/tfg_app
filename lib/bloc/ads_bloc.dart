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
  List<Ad> _lastestAdsFetched = [];

  AdsBloc({@required this.repository, this.category = Category.DOGS})
      : super(AdsInitial());

  @override
  void onTransition(Transition<AdsEvent, AdsState> transition) {
    super.onTransition(transition);

    if (transition.nextState is AdsSuccess) {
      _currentEndCursor =
          (transition.nextState as AdsSuccess).paginatedAds.pageInfo.endCursor;
      _lastestAdsFetched =
          (transition.nextState as AdsSuccess).paginatedAds.ads.toList();
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
        yield await _mapMoreAdsFetchedToState(event);
        break;
      case CategorySelected:
        category = (event as CategorySelected).category;
        yield CategoryChanged(category: category);
        break;
      default:
        break;
    }
  }

  Future<AdsState> _mapMoreAdsFetchedToState(MoreAdsFetched event) async {
    print('Trying to fetch more ads but: $_hasNextPage');
    if (_hasNextPage) {
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
              ..ads = BuiltList<Ad>(
                      []..addAll(_lastestAdsFetched)..addAll(paginatedAds.ads))
                  .toBuilder()));
      } catch (err, stacktrace) {
        print('Ads BLoC OnCatch $err, $stacktrace');
        return AdsFailure();
      }
    }
    return state;
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
    final nonDebounceStream = events.where((event) => event is! MoreAdsFetched);
    final debounceStream = events
        .where((event) => event is MoreAdsFetched)
        .debounceTime(Duration(milliseconds: 600));

    return super.transformEvents(
        MergeStream([nonDebounceStream, debounceStream]), transitionFn);
  }

  bool get _hasNextPage =>
      state is AdsSuccess &&
      (state as AdsSuccess).paginatedAds.pageInfo.hasNextPage;
}
