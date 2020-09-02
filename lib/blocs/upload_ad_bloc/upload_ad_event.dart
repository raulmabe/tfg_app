part of 'upload_ad_bloc.dart';

@immutable
abstract class UploadAdEvent {}

class AdCategoryChanged extends UploadAdEvent {
  final Category category;
  AdCategoryChanged(this.category);
}

class AdDescriptionChanged extends UploadAdEvent {
  final String description;
  AdDescriptionChanged(this.description);
}

// Animal Ads
class AdNameChanged extends UploadAdEvent {
  final String name;
  AdNameChanged(this.name);
}

class AdTagsChanged extends UploadAdEvent {
  final List<String> tags;
  AdTagsChanged(this.tags);
}

class AdSexChanged extends UploadAdEvent {
  final bool male;
  AdSexChanged(this.male);
}

class AdActivityLevelChanged extends UploadAdEvent {
  final ActivityLevel level;
  AdActivityLevelChanged(this.level);
}

class AdPersonalityChanged extends UploadAdEvent {
  final List<String> personality;
  AdPersonalityChanged(this.personality);
}

class AdWeightChanged extends UploadAdEvent {
  final double weight;
  AdWeightChanged(this.weight);
}

class AdMustKnowChanged extends UploadAdEvent {
  final String mustKnow;
  AdMustKnowChanged(this.mustKnow);
}

class AdBreedChanged extends UploadAdEvent {
  final String breed;
  AdBreedChanged(this.breed);
}

class AdDeliveryInfoChanged extends UploadAdEvent {
  final List<DeliveryStatus> deliveryInfo;
  AdDeliveryInfoChanged(this.deliveryInfo);
}

class AdBirthDateChanged extends UploadAdEvent {
  final DateTime birthDate;
  AdBirthDateChanged(this.birthDate);
}

class AdAdoptionTaxChanged extends UploadAdEvent {
  final double adoptionTax;
  AdAdoptionTaxChanged(this.adoptionTax);
}

class AdImgChanged extends UploadAdEvent {
  final List<dynamic> files;
  AdImgChanged(this.files);
}

// Others ads
class AdTitleChanged extends UploadAdEvent {
  final String title;
  AdTitleChanged(this.title);
}

class AdPriceChanged extends UploadAdEvent {
  final double price;
  AdPriceChanged(this.price);
}

class AdSubmitted extends UploadAdEvent {}
