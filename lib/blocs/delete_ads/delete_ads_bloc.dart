import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:jumpets_app/data/repositories/ads_repository.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:meta/meta.dart';

part 'delete_ads_event.dart';
part 'delete_ads_state.dart';

class DeleteAdsBloc extends Bloc<DeleteAdsEvent, DeleteAdsState> {
  final AdsRepository repository;
  final AuthBloc authBloc;
  final ErrorHandlerBloc errorBloc;
  DeleteAdsBloc(
      {@required this.repository,
      @required this.authBloc,
      @required this.errorBloc})
      : assert(authBloc != null),
        assert(errorBloc != null),
        assert(repository != null),
        super(DeleteAdsInitial());

  @override
  Stream<DeleteAdsState> mapEventToState(
    DeleteAdsEvent event,
  ) async* {
    if (event is AdDeleted) {
      yield DeleteAdsLoading();

      try {
        if (event.ad is AnimalAd) {
          await repository.deleteAnimalAd(
              id: event.ad.id,
              token: authBloc.state.authStatus?.authData?.token);
        }

        if (event.ad is ProductAd) {
          await repository.deleteProductAd(
              id: event.ad.id,
              token: authBloc.state.authStatus?.authData?.token);
        }

        if (event.ad is ServiceAd) {
          await repository.deleteServiceAd(
              id: event.ad.id,
              token: authBloc.state.authStatus?.authData?.token);
        }
        yield DeleteAdsSuccess();
      } catch (err, stack) {
        errorBloc.add(ErrorHandlerCatched(
          bloc: this,
          event: event,
          error: err.toString(),
        ));
        yield DeleteAdsFailure();
      }
    }
  }
}
