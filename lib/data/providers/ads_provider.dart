import 'dart:async';

import 'package:jumpets_app/data/api_base_helper.dart';
import 'package:jumpets_app/data/providers/user_provider.dart';
import 'package:jumpets_app/models/models.dart';

class AdsProvider {
  final ApiBaseHelper _api;

  AdsProvider() : this._api = ApiBaseHelper();

  static get adFragment =>
      '''
  fragment adFields on Ad {
    id: _id
          tags
          photos
          ... on ProductAd {
            title
            description
            price
            type: __typename
          }
          ... on ServiceAd {
            title
            description
            priceHour
            type: __typename
          }
          ... on AnimalAd {
            name
            description
            activityLevel
            birthDate
            male
            adoptionTax
            weight
            personality
            mustKnow
            deliveryInfo
            breed
            ... on Dog {
              size
              type
            }
            ... on OtherAnimal {
              type
            }
          }
          createdAt
          creator {
            ...userFields
          }
  }
  ''' +
      UserProvider.getUserFragment();

  Future<dynamic> getPaginatedAds(
      {Category category,
      int first,
      String after,
      int photosWidth,
      int photosHeight,
      int thumbnailWidth,
      int thumbnailHeight}) async {
    return _api.post({
      'query': '''{
    ads(category: $category, first: $first, after: \"$after\") {
      totalCount
      edges{
        node{
          ...adFields
        }
        cursor
      }
      pageInfo {
        hasPreviousPage
        hasNextPage
        endCursor
      }
    }
  }''' +
          adFragment
    });
  }

  Future<dynamic> getFavs({String token}) async {
    return _api.post({
      'query': '''{
  savedAds {
     ...adFields
  }
}''' +
          adFragment
    }, token: token);
  }

  Future<dynamic> saveAd({String token, String id}) async {
    return _api.post({
      'query': '''mutation{
  saveAd(id: "$id") {
     ...adFields
  }
}''' +
          adFragment
    }, token: token);
  }

  Future<dynamic> unsaveAd({String token, String id}) async {
    return _api.post({
      'query': '''mutation{
  unsaveAd(id: "$id") {
     ...adFields
  }
}''' +
          adFragment
    }, token: token);
  }

  Future<dynamic> getCloseShelters({String token}) async {
    return _api.post({
      'query': '''{
  getCloseShelters{
    protectora {
      ...userFields
    }
    distance
    travelTime
  }
}''' +
          UserProvider.getUserFragment()
    }, token: token);
  }

  Future<dynamic> searchAds(
      {String text,
      DogSize size,
      List<DeliveryStatus> deliveryInfo,
      bool male,
      ActivityLevel activityLevel,
      AnimalType type,
      String creator}) async {
    String creatorEscaped = creator != null ? '"$creator"' : null;
    String textEscaped = text != null ? '"$text"' : null;
    String tagsEscaped = text != null ? '["$text"]' : null;

    return _api.post({
      'query': '''{
    searchAds1: searchAds(filters: {
      creator: $creatorEscaped,
      name: $textEscaped,
      tags: null,
      breed: null,
      size: $size,
      deliveryInfo: $deliveryInfo,
      male: $male,
      activityLevel: $activityLevel,
      type: $type
    }) {
          ...adFields
    }

    searchAds2: searchAds(filters: {
      creator: $creatorEscaped,
      name: null,
      tags: null,
      breed: $textEscaped,
      size: $size,
      deliveryInfo: $deliveryInfo,
      male: $male,
      activityLevel: $activityLevel,
      type: $type
    }) {
          ...adFields
    }

     searchAds3: searchAds(filters: {
      creator: $creatorEscaped,
      name: null,
      tags: $tagsEscaped,
      breed: null,
      size: $size,
      deliveryInfo: $deliveryInfo,
      male: $male,
      activityLevel: $activityLevel,
      type: $type
    }) {
          ...adFields
    }
  }''' +
          adFragment
    });
  }
}
