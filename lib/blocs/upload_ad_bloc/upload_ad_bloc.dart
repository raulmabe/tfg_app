import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
import 'package:jumpets_app/blocs/info_handler_bloc/info_handler_bloc.dart';
import 'package:jumpets_app/data/repositories/ads_repository.dart';
import 'package:jumpets_app/models/enums/activity_level.dart';
import 'package:jumpets_app/models/enums/categories.dart';
import 'package:jumpets_app/models/enums/delivery_status.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:meta/meta.dart';

part 'upload_ad_event.dart';
part 'upload_ad_state.dart';

class UploadAdBloc extends Bloc<UploadAdEvent, UploadAdState> {
  final AdsRepository repository;
  final ErrorHandlerBloc errorBloc;
  final InfoHandlerBloc infoBloc;
  final AuthBloc authBloc;
  UploadAdBloc(
      {@required this.repository,
      @required this.errorBloc,
      @required this.infoBloc,
      @required this.authBloc})
      : assert(repository != null),
        assert(errorBloc != null),
        assert(infoBloc != null),
        assert(authBloc != null),
        super(UploadAdState());

  @override
  Stream<UploadAdState> mapEventToState(
    UploadAdEvent event,
  ) async* {
    switch (event.runtimeType) {
      case AdCategoryChanged:
        yield _mapAdCategoryChangedToState(event);
        break;
      case AdDescriptionChanged:
        yield _mapAdDescriptionChangedToState(event);
        break;
      case AdTagsChanged:
        yield _mapAdTagsChangedToState(event);
        break;
      case AdImgChanged:
        yield _mapAdImgChangedToState(event);
        break;

      // * Others
      case AdTitleChanged:
        yield _mapAdTitleChangedToState(event);
        break;
      case AdPriceChanged:
        yield _mapAdPriceChangedToState(event);
        break;

      // * Animals
      case AdNameChanged:
        yield _mapAdNameChangedToState(event);
        break;
      case AdActivityLevelChanged:
        yield _mapAdActivityLevelChangedToState(event);
        break;
      case AdDogSizeChanged:
        yield _mapAdDogSizeChangedToState(event);
        break;
      case AdPersonalityChanged:
        yield _mapAdPersonalityChangedToState(event);
        break;
      case AdWeightChanged:
        yield _mapAdWeightChangedToState(event);
        break;
      case AdMustKnowChanged:
        yield _mapAdMustKnowChangedToState(event);
        break;

      case AdBreedChanged:
        yield _mapAdBreedChangedToState(event);
        break;

      case AdDeliveryInfoChanged:
        yield _mapAdDeliveryInfoChangedToState(event);
        break;

      case AdBirthDateChanged:
        yield _mapAdBirthDateChangedToState(event);
        break;

      case AdAdoptionTaxChanged:
        yield _mapAdAdoptionTaxChangedToState(event);
        break;
      case AdSexChanged:
        yield _mapAdSexChangedToState(event);
        break;

      case AdSubmitted:
        yield* _mapAdSubmittedChangedToState(event);
        break;
      default:
    }
  }

  UploadAdState _mapAdCategoryChangedToState(AdCategoryChanged event) =>
      state.copyWith(category: event.category);

  UploadAdState _mapAdDescriptionChangedToState(AdDescriptionChanged event) =>
      state.copyWith(description: AdString.dirty(event.description));

  UploadAdState _mapAdTagsChangedToState(AdTagsChanged event) =>
      state.copyWith(tags: event.tags);

  UploadAdState _mapAdImgChangedToState(AdImgChanged event) =>
      state.copyWith(photos: event.files);

  UploadAdState _mapAdTitleChangedToState(AdTitleChanged event) =>
      state.copyWith(title: AdString.dirty(event.title));

  UploadAdState _mapAdPriceChangedToState(AdPriceChanged event) =>
      state.copyWith(price: AdDouble.dirty(event.price));

  UploadAdState _mapAdNameChangedToState(AdNameChanged event) =>
      state.copyWith(name: AdString.dirty(event.name));

  UploadAdState _mapAdActivityLevelChangedToState(
          AdActivityLevelChanged event) =>
      state.copyWith(activityLevel: event.level);

  UploadAdState _mapAdDogSizeChangedToState(AdDogSizeChanged event) =>
      state.copyWith(dogSize: event.dogSize);

  UploadAdState _mapAdPersonalityChangedToState(AdPersonalityChanged event) =>
      state.copyWith(personality: event.personality);

  UploadAdState _mapAdWeightChangedToState(AdWeightChanged event) =>
      state.copyWith(weight: AdDouble.dirty(event.weight));

  UploadAdState _mapAdMustKnowChangedToState(AdMustKnowChanged event) =>
      state.copyWith(mustKnow: AdString.dirty(event.mustKnow));

  UploadAdState _mapAdBreedChangedToState(AdBreedChanged event) =>
      state.copyWith(breed: AdString.dirty(event.breed));

  UploadAdState _mapAdDeliveryInfoChangedToState(AdDeliveryInfoChanged event) =>
      state.copyWith(deliveryInfo: event.deliveryInfo);

  UploadAdState _mapAdBirthDateChangedToState(AdBirthDateChanged event) =>
      state.copyWith(birthDate: event.birthDate);

  UploadAdState _mapAdAdoptionTaxChangedToState(AdAdoptionTaxChanged event) =>
      state.copyWith(adoptionTax: AdDouble.dirty(event.adoptionTax));

  UploadAdState _mapAdSexChangedToState(AdSexChanged event) =>
      state.copyWith(male: event.male);

  Stream<UploadAdState> _mapAdSubmittedChangedToState(
      UploadAdEvent event) async* {
    if (isValid) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      try {
        Ad ad;
        if (state.category.isAnimal) {
          ad = await repository.createAnimalAd(
              photos: state.photos,
              description: state.description.value,
              tags: state.tags,
              name: state.name.value,
              mustKnow: state.mustKnow.value,
              breed: state.breed.value,
              weight: state.weight.value,
              dogSize: state.dogSize,
              adoptionTax: state.adoptionTax.value,
              personality: state.personality,
              birthDate: state.birthDate,
              deliveryInfo: state.deliveryInfo,
              male: state.male,
              activityLevel: state.activityLevel,
              type: state.category.animalType,
              token: authBloc.state.authStatus?.authData?.token);
        } else if (state.category.isProduct) {
          ad = await repository.createProductAd(
              photos: state.photos,
              description: state.description.value,
              tags: state.tags,
              title: state.title.value,
              price: state.price.value,
              token: authBloc.state.authStatus?.authData?.token);
        } else if (state.category.isService) {
          ad = await repository.createServiceAd(
              photos: state.photos,
              description: state.description.value,
              tags: state.tags,
              title: state.title.value,
              price: state.price.value,
              token: authBloc.state.authStatus?.authData?.token);
        }

        yield UploadAdState(status: FormzStatus.submissionSuccess, ad: ad);
        infoBloc.add(MessageAdded(
            msg: 'uploading_background_will_be_redirected',
            notification: true));
      } catch (err, stack) {
        errorBloc
            .add(ErrorHandlerCatched(bloc: this, event: event, error: err));
        print('onCatch $err, $stack');
        yield state.copyWith(status: FormzStatus.submissionFailure);
      }
    }
  }

  bool get isValid {
    if (state.category.isAnimal) {
      FormzStatus status = Formz.validate([
        state.name,
        state.description,
        state.mustKnow,
        state.breed,
        state.weight,
        state.adoptionTax,
      ]);

      return status.isValidated &&
          state.tags.isNotEmpty &&
          state.personality.isNotEmpty &&
          state.photos.isNotEmpty &&
          state.deliveryInfo.isNotEmpty &&
          state.male != null &&
          state.activityLevel != null &&
          state.birthDate != null &&
          ((state.category == Category.DOGS && state.dogSize != null) ||
              state.category != Category.DOGS);
    } else if (state.category.isProduct || state.category.isService) {
      FormzStatus status = Formz.validate([
        state.title,
        state.description,
        state.price,
      ]);

      return status.isValidated && state.tags.isNotEmpty;
    }
    return false;
  }
}
