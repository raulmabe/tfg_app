import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:jumpets_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:jumpets_app/blocs/error_handler_bloc/error_handler_bloc.dart';
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
  final AuthBloc authBloc;
  UploadAdBloc(
      {@required this.repository,
      @required this.errorBloc,
      @required this.authBloc})
      : assert(repository != null),
        assert(errorBloc != null),
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
      state.copyWith(tags: AdListStrings.dirty(event.tags));

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

  UploadAdState _mapAdPersonalityChangedToState(AdPersonalityChanged event) =>
      state.copyWith(personality: AdListStrings.dirty(event.personality));

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
              tags: state.tags.value,
              name: state.name.value,
              mustKnow: state.mustKnow.value,
              breed: state.breed.value,
              weight: state.weight.value,
              adoptionTax: state.adoptionTax.value,
              personality: state.personality.value,
              birthDate: state.birthDate,
              deliveryInfo: state.deliveryInfo,
              male: state.male,
              activityLevel: state.activityLevel,
              type: state.category.animalType,
              token: authBloc.state.authStatus?.authData?.token);
        }

        yield state.copyWith(status: FormzStatus.submissionSuccess);
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
        state.tags,
        state.mustKnow,
        state.breed,
        state.weight,
        state.adoptionTax,
        state.personality,
      ]);

      return status.isValidated &&
          state.photos.isNotEmpty &&
          state.deliveryInfo.isNotEmpty &&
          state.male != null &&
          state.activityLevel != null &&
          state.birthDate != null;
    } else if (state.category.isProduct || state.category.isService) {
      FormzStatus status = Formz.validate([
        state.title,
        state.description,
        state.tags,
        state.price,
      ]);

      return status.isValidated;
    }
    return false;
  }
}
