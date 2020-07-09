import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:jumpets_app/models/ads/ad.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/models/enums/categories.dart' as Categories;

abstract class NetworkError {
  final String error;
  NetworkError(this.error);
}

class ErrorHandledAction {}

class GetAnimalAds {
  final Completer completer;
  GetAnimalAds({this.completer});
}

class GotAnimalAds implements NetworkError {
  final List<AnimalAd> ads;
  final String _error;
  GotAnimalAds({@required this.ads, String error}) : _error = error;

  @override
  // TODO: implement error
  String get error => _error;
}

class SelectCategory {
  final Categories.Category category;
  SelectCategory(this.category);
}

class GetFavAds {}

class GotFavAds implements NetworkError {
  final List<Ad> ads;
  final String _error;
  GotFavAds({@required this.ads, String error}) : _error = error;

  @override
  // TODO: implement error
  String get error => _error;
}
