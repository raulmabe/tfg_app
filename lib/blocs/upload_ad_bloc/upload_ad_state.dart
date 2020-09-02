part of 'upload_ad_bloc.dart';

@immutable
class UploadAdState {
  UploadAdState({
    this.status = FormzStatus.pure,
    this.category = Category.DOGS,
    this.photos,
    this.description = const AdString.pure(),
    this.tags = const AdListStrings.pure(),
    this.name = const AdString.pure(),
    this.mustKnow = const AdString.pure(),
    this.breed = const AdString.pure(),
    this.weight = const AdDouble.pure(),
    this.adoptionTax = const AdDouble.pure(),
    this.personality = const AdListStrings.pure(),
    this.birthDate,
    this.deliveryInfo,
    this.male,
    this.activityLevel,
    this.title = const AdString.pure(),
    this.price = const AdDouble.pure(),
  }) {
    if (photos == null) photos = [];
    if (deliveryInfo == null) photos = [];
  }

  final FormzStatus status;

  final Category category;

  List<dynamic> photos;
  final AdString description;
  final AdListStrings tags;

  final AdString name;
  final AdString mustKnow;
  final AdString breed;
  final AdDouble weight;
  final AdDouble adoptionTax;
  final AdListStrings personality;
  final DateTime birthDate;
  List<DeliveryStatus> deliveryInfo;
  final bool male;
  final ActivityLevel activityLevel;

  final AdString title;
  final AdDouble price;

  UploadAdState copyWith({
    FormzStatus status,
    List<dynamic> photos,
    AdString description,
    AdListStrings tags,
    AdString name,
    AdString mustKnow,
    AdString breed,
    AdDouble weight,
    AdDouble adoptionTax,
    AdListStrings personality,
    DateTime birthDate,
    List<DeliveryStatus> deliveryInfo,
    bool male,
    ActivityLevel activityLevel,
    AdString title,
    AdDouble price,
    Category category,
  }) {
    return UploadAdState(
      category: category ?? this.category,
      status: status ?? this.status,
      photos: photos ?? this.photos,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      name: name ?? this.name,
      mustKnow: mustKnow ?? this.mustKnow,
      breed: breed ?? this.breed,
      weight: weight ?? this.weight,
      adoptionTax: adoptionTax ?? this.adoptionTax,
      personality: personality ?? this.personality,
      birthDate: birthDate ?? this.birthDate,
      deliveryInfo: deliveryInfo ?? this.deliveryInfo,
      male: male ?? this.male,
      activityLevel: activityLevel ?? this.activityLevel,
      title: title ?? this.title,
      price: price ?? this.price,
    );
  }

  @override
  String toString() {
    return status.toString();
  }
}
