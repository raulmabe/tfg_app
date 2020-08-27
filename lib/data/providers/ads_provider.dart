import 'dart:async';

import 'package:jumpets_app/data/api_base_helper.dart';
import 'package:jumpets_app/models/models.dart';

class AdsProvider {
  final ApiBaseHelper _api;

  AdsProvider() : this._api = ApiBaseHelper();

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
          id: _id
          tags
          photos(options: {width: $photosWidth, height: $photosHeight})
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
            id: _id
            type: __typename
            thumbnail(options: {
              width: $thumbnailWidth,
              height: $thumbnailHeight
            })
            name
            address
            email
            phone
            ... on Protectora {
              web
            }
            ... on Profesional {
              web
            }
            createdAt
            updatedAt
            valuations {
              author {
                 id: _id
                  type: __typename
                  thumbnail(options: {
                    width: $thumbnailWidth,
                    height: $thumbnailHeight
                  })
                  name
                  address
                  email
                  phone
                  ... on Protectora {
                    web
                  }
                  ... on Profesional {
                    web
                  }
                  createdAt
                  updatedAt
              }
              value
              comment
              updatedAt
              createdAt
            }
          }
        }
        cursor
      }
      pageInfo {
        hasPreviousPage
        hasNextPage
        endCursor
      }
    }
  }'''
    });
  }

  Future<dynamic> getFavs({String token}) async {
    return _api.post({
      'query': '''{
  savedAds {
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
            type
              size
            }
            ... on OtherAnimal {
              
            type
            }
          }
          createdAt
          creator {
            id: _id
            type: __typename
            thumbnail
            email
            name
            address
            phone
            createdAt
            updatedAt
            ... on Protectora {
              web
            }
            ... on Profesional {
              web
            }
          }
  }
}'''
    }, token: token);
  }

  Future<dynamic> saveAd({String token, String id}) async {
    return _api.post({
      'query': '''mutation{
  saveAd(id: "$id") {
     id: _id
          tags
          photos(options: {width: null, height: null})
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
            type
              size
            }
            ... on OtherAnimal {
              
            type
            }
          }
          createdAt
          creator {
            id: _id
            type: __typename
            thumbnail(options: {
              width: null,
              height: null
            })
            email
            name
            address
            phone
            ... on Protectora {
              web
            }
            ... on Profesional {
              web
            }

            createdAt
            updatedAt
          }
  }
}'''
    }, token: token);
  }

  Future<dynamic> unsaveAd({String token, String id}) async {
    return _api.post({
      'query': '''mutation{
  unsaveAd(id: "$id") {
     id: _id
          tags
          photos(options: {width: null, height: null})
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
            type
              size
            }
            ... on OtherAnimal {
              
            type
            }
          }
          createdAt
          creator {
            id: _id
            type: __typename
            thumbnail(options: {
              width: null,
              height: null
            })
            email
            name
            address
            phone
            ... on Protectora {
              web
            }
            ... on Profesional {
              web
            }
            createdAt
            updatedAt
          }
  }
}'''
    }, token: token);
  }

  Future<dynamic> getCloseShelters({String token}) async {
    return _api.post({
      'query': '''{
  getCloseShelters{
    protectora {
      id: _id
      type: __typename
      thumbnail
      name
      address
      email
      phone
      web
      createdAt
      updatedAt
    }
    distance
    travelTime
  }
}'''
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
            id: _id
            type: __typename
            thumbnail
            name
            address
            email
            phone
            ... on Protectora {
              web
            }
            ... on Profesional {
              web
            }
            createdAt
            updatedAt
          }
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
            id: _id
            type: __typename
            thumbnail
            name
            address
            email
            phone
            ... on Protectora {
              web
            }
            ... on Profesional {
              web
            }
            createdAt
            updatedAt
          }
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
            id: _id
            type: __typename
            thumbnail
            name
            address
            email
            phone
            ... on Protectora {
              web
            }
            ... on Profesional {
              web
            }
            createdAt
            updatedAt
          }
    }
  }'''
    });
  }
}
