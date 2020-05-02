import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:jumpets_app/models/ads/ad.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/models/enums/categories.dart' as Categories;

class GetAnimalAds {
  final Completer completer;
  GetAnimalAds({this.completer});
}

class GotAnimalAds {
  final List<AnimalAd> ads;
  final String error;
  GotAnimalAds({@required this.ads, this.error});
}

class SelectCategory {
  final Categories.Category category;
  SelectCategory(this.category);
}

class GetFavAds {}

class GotFavAds {
  final List<Ad> ads;
  final String error;
  GotFavAds({@required this.ads, this.error});
}
