import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:jumpets_app/models/ads/ad.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/models/enums/categories.dart' as Categories;

class NetworkError {
  final int status;
  final String msg;
  NetworkError({this.msg, this.status});
}

class GetPaginatedAds {
  final int first;
  final String after;
  final int photosHeight;
  final int photosWidth;
  final int thumbnailHeight;
  final int thumbnailWidth;
  GetPaginatedAds(
      {@required this.first,
      this.after,
      @required this.photosHeight,
      @required this.photosWidth,
      @required this.thumbnailHeight,
      @required this.thumbnailWidth});
}

class GotPaginatedAds {
  final List<Ad> ads;
  final bool hasMore;
  final String lastCursor;

  GotPaginatedAds({
    @required this.lastCursor,
    @required this.ads,
    @required this.hasMore,
  });
}

class GotPaginatedAdsError implements NetworkError {
  final int status;
  final String msg;

  GotPaginatedAdsError({
    @required this.msg,
    @required this.status,
  });
}

class SelectCategory {
  final Categories.Category category;
  SelectCategory(this.category);
}
