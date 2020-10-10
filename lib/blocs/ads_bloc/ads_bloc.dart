import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:jumpets_app/data/repositories/ads_repository.dart';
import 'package:jumpets_app/data/repositories/general_repository.dart';
import 'package:jumpets_app/models/enums/categories.dart';
import 'package:jumpets_app/models/errors/network_error.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/models/wrappers/paginated_ads.dart';
import 'package:built_collection/built_collection.dart';
import 'package:jumpets_app/ui/helper.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'ads_event.dart';
part 'ads_state.dart';

class AdsBloc extends Bloc<AdsEvent, AdsState> {
  final AdsRepository repository;
  final GeneralRepository generalRepository;
  final AuthBloc authBloc;
  String _currentEndCursor;
  Category category;
  List<Ad> _lastestAdsFetched = [];
  AdsSearched filters;
  bool searchMode;
  final ErrorHandlerBloc errorBloc;

  AdsBloc(
      {@required this.repository,
      @required this.generalRepository,
      @required this.authBloc,
      @required this.errorBloc,
      this.category = Category.DOGS,
      this.searchMode = false})
      : assert(repository != null),
        assert(authBloc != null),
        assert(errorBloc != null),
        super(AdsInitial());

  @override
  void onTransition(Transition<AdsEvent, AdsState> transition) {
    super.onTransition(transition);

    if (transition.nextState is AdsSuccess) {
      _currentEndCursor = (transition.nextState as AdsSuccess)
              .paginatedAds
              ?.pageInfo
              ?.endCursor ??
          _currentEndCursor;
      _lastestAdsFetched =
          (transition.nextState as AdsSuccess).paginatedAds?.ads?.toList() ??
              _lastestAdsFetched;
    }
  }

  @override
  Stream<AdsState> mapEventToState(
    AdsEvent event,
  ) async* {
    switch (event.runtimeType) {
      case LastAdsRefreshed:
        yield _mapLastAdsRefreshedToState(event);
        break;
      case AdsFetched:
        if (searchMode) {
          filters = null;
          searchMode = false;
          yield SearchModeChanged(searchMode);
        }
        yield AdsLoading();
        yield await _mapAdsFetchedToState(event);
        break;
      case MoreAdsFetched:
        yield* _mapMoreAdsFetchedToState(event);
        break;
      case AdsSearched:
        if (isEventSearchValid(event)) {
          if (!searchMode) {
            searchMode = true;
            yield SearchModeChanged(searchMode);
          }
          filters = event;
          yield AdsLoading();
          yield await _mapAdsSearchedToState(event);
        } else {
          if (searchMode) {
            this.add(SearchModeDisabled());
            this.add(LastAdsRefreshed());
          }
        }
        break;
      case SearchModeDisabled:
        filters = null;
        searchMode = false;
        yield SearchModeChanged(searchMode);
        break;
      case CategorySelected:
        category = (event as CategorySelected).category;
        yield CategoryChanged(category: category);
        break;
      default:
        break;
    }
  }

  bool isEventSearchValid(AdsSearched event) {
    return (event.size != null) ||
        (event.text != null && (event.text?.isNotEmpty ?? false)) ||
        (event.male != null) ||
        (event.deliveryInfo != null) ||
        (event.activityLevel != null) ||
        event.creator != null;
  }

  AdsState _mapLastAdsRefreshedToState(LastAdsRefreshed event) {
    if (filters != null && searchMode && isCategoryValidToSearch) {
      this.add(filters);
    } else {
      this.add(AdsFetched());
    }
    return state;
  }

  Future<AdsState> _mapAdsSearchedToState(AdsSearched event) async {
    if (!isCategoryValidToSearch)
      return AdsFailure(
          retry: () => this.add(event), msg: 'category_not_valid');

    try {
      final ads = await repository.searchAds(
        text: event.text,
        size: event.size,
        deliveryInfo: event.deliveryInfo,
        male: event.male,
        activityLevel: event.activityLevel,
        type: Helper.getAnimalTypeFromCategory(category),
        creator: event.creator,
      );
      return AdsSuccess(searchedAds: ads, infoCards: await _fetchInfo());
    } catch (err, stacktrace) {
      print('Ads BLoC OnCatch $err, $stacktrace');
      return AdsFailure(retry: () => this.add(event), msg: err.toString());
    }
  }

  Stream<AdsState> _mapMoreAdsFetchedToState(MoreAdsFetched event) async* {
    if (category == Category.SHELTERS) {
      yield state;
    } else {
      print('Trying to fetch more ads but: $_hasNextPage');
      if (_hasNextPage) {
        yield AdsLoadingMore(ads: _lastestAdsFetched);
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
          yield AdsSuccess(
              infoCards: await _fetchInfo(),
              paginatedAds: paginatedAds.rebuild((b) => b
                ..ads = BuiltList<Ad>([]
                      ..addAll(_lastestAdsFetched)
                      ..addAll(paginatedAds.ads))
                    .toBuilder()));
        } catch (err, stacktrace) {
          print('Ads BLoC OnCatch $err, $stacktrace');
          yield AdsFailure(retry: () => this.add(event), msg: err.toString());
        }
      } else {
        yield state;
      }
    }
  }

  Future<AdsState> _mapAdsFetchedToState(AdsFetched event) async {
    try {
      if (category == Category.SHELTERS) {
        if (!authBloc.state.authStatus.status.isAuthenticated) {
          throw InvalidArgsError(msg: 'You must be logged in');
        }

        if (authBloc.state.authStatus.authData.user.address == null ||
            authBloc.state.authStatus.authData.user.address.isEmpty) {
          throw InvalidArgsError(msg: 'need_a_valid_address');
        }

        final shelters = await repository.getCloseShelters(
            token: authBloc.state.authStatus?.authData?.token);
        return AdsSuccess(shelters: shelters, infoCards: await _fetchInfo());
      } else {
        final paginatedAds = await repository.getPaginatedAds(
          category: category,
          first: 10,
          after: null,
          photosWidth: event.photosWidth,
          photosHeight: event.photosHeight,
          thumbnailHeight: event.thumbnailHeight,
          thumbnailWidth: event.thumbnailWidth,
        );
        return AdsSuccess(
            paginatedAds: paginatedAds, infoCards: await _fetchInfo());
      }
    } catch (err, stacktrace) {
      print('Ads BLoC OnCatch $err, $stacktrace');
      return AdsFailure(retry: () => this.add(event), msg: err.toString());
    }
  }

  Future<List<InfoCardViewModel>> _fetchInfo() async {
    try {
      List<InfoCardViewModel> list = await generalRepository.getInfo();
      print('Hola ${list.length}');
      return list;
    } catch (err, stack) {
      print(err.toString() + stack.toString());
      return [];
    }
  }

  @override
  Stream<Transition<AdsEvent, AdsState>> transformEvents(
      Stream<AdsEvent> events,
      TransitionFunction<AdsEvent, AdsState> transitionFn) {
    final nonDebounceStream = events
        .where((event) => (event is! MoreAdsFetched && event is! AdsSearched));
    final debounceStream = events
        .where((event) => event is MoreAdsFetched || event is AdsSearched)
        .debounceTime(Duration(milliseconds: 300));

    return super.transformEvents(
        MergeStream([nonDebounceStream, debounceStream]), transitionFn);
  }

  bool get isCategoryValidToSearch =>
      category != Category.SHELTERS &&
      category != Category.PRODUCTS &&
      category != Category.SERVICES;

  bool get _hasNextPage =>
      state is AdsSuccess &&
      !searchMode &&
      (state as AdsSuccess).paginatedAds.pageInfo.hasNextPage;
}
