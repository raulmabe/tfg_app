part of 'upload_ad_bloc.dart';

class UploadAdState {
  UploadAdState(
      {this.status = FormzStatus.pure,
      this.category = Category.DOGS,
      this.photos,
      this.description = const AdString.pure(),
      this.name = const AdString.pure(),
      this.mustKnow = const AdString.pure(),
      this.breed = const AdString.pure(),
      this.weight = const AdDouble.pure(),
      this.adoptionTax = const AdDouble.pure(),
      this.personality,
      this.tags,
      this.birthDate,
      this.deliveryInfo,
      this.male,
      this.activityLevel,
      this.dogSize,
      this.title = const AdString.pure(),
      this.price = const AdDouble.pure(),
      this.ad}) {
    if (photos == null) photos = [];
    if (deliveryInfo == null) deliveryInfo = [];
    if (tags == null) tags = [];
    if (personality == null) personality = [];
  }

  final FormzStatus status;

  final Category category;

  List<dynamic> photos;
  final AdString description;
  List<String> tags;

  final AdString name;
  final AdString mustKnow;
  final AdString breed;
  final AdDouble weight;
  final AdDouble adoptionTax;
  List<String> personality;
  final DateTime birthDate;
  List<DeliveryStatus> deliveryInfo;
  final bool male;
  final ActivityLevel activityLevel;
  final DogSize dogSize;
  final AdString title;
  final AdDouble price;

  final Ad ad;

  UploadAdState copyWith({
    FormzStatus status,
    List<dynamic> photos,
    AdString description,
    List<String> tags,
    AdString name,
    AdString mustKnow,
    AdString breed,
    AdDouble weight,
    AdDouble adoptionTax,
    List<String> personality,
    DateTime birthDate,
    List<DeliveryStatus> deliveryInfo,
    bool male,
    ActivityLevel activityLevel,
    DogSize dogSize,
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
      dogSize: dogSize ?? this.dogSize,
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
