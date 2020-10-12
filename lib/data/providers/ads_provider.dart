import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:jumpets_app/data/api_base_helper.dart';
import 'package:jumpets_app/data/providers/user_provider.dart';
import 'package:jumpets_app/models/models.dart';

class AdsProvider {
  final ApiBaseHelper _api;

  AdsProvider() : this._api = ApiBaseHelper();

  static get animalAdFragment =>
      '''
  fragment animalAdFields on AnimalAd {
    id: _id
          tags
          photos
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
          
          createdAt
          creator {
            ...userFields
          }
  }
  ''' +
      UserProvider.getUserFragment;

  static get serviceAdFragment =>
      '''
  fragment serviceAdFields on ServiceAd {
    id: _id
          tags
          photos
          
            title
            description
            priceHour
            type: __typename
          
          createdAt
          creator {
            ...userFields
          }
  }
  ''' +
      UserProvider.getUserFragment;

  static get productAdFragment =>
      '''
  fragment productAdFields on ProductAd {
    id: _id
          tags
          photos
          
            title
            description
            price
            type: __typename
          
          createdAt
          creator {
            ...userFields
          }
  }
  ''' +
      UserProvider.getUserFragment;

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
      UserProvider.getUserFragment;

  Future<dynamic> getPaginatedAds(
      {Category category,
      int first,
      String after,
      int photosWidth,
      int photosHeight,
      int thumbnailWidth,
      int thumbnailHeight,
      String token}) async {
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
    }, token: token);
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
          UserProvider.getUserFragment
    }, token: token);
  }

  Future<dynamic> createAnimalAd(
      {List<dynamic> photos,
      String description,
      List<String> tags,
      String name,
      String mustKnow,
      String breed,
      DogSize dogSize,
      double weight,
      double adoptionTax,
      List<String> personality,
      DateTime birthDate,
      List<DeliveryStatus> deliveryInfo,
      bool male,
      ActivityLevel activityLevel,
      AnimalType type,
      String token}) async {
    var operations = {
      'query': '''
       mutation(\$files: [Upload!]!) {
          createAnimalAd(
            adInput: {
              name: "$name"
              description: "$description"
              breed: "$breed"
              mustKnow: "$mustKnow"
              type: ${type.name.toUpperCase()}
              tags: ${tags.toInnerString()}
              personality: ${personality.toInnerString()}
              photos: \$files
              deliveryInfo: $deliveryInfo
              weight: $weight
              male: $male
              size: $dogSize
              adoptionTax: $adoptionTax
              birthDate: "${birthDate.toIso8601String()}"
              activityLevel: ${activityLevel.name.toUpperCase()}
            }
          ) {
            ...animalAdFields
          }
        }
      ''' +
          animalAdFragment,
      'variables': {'files': List.generate(photos.length, (index) => null)}
    };

    final map = <String, dynamic>{
      'operations': json.encode(operations),
      'map': json.encode(Map()
        ..addEntries(List.generate(
            photos.length,
            (index) => MapEntry<String, List<String>>(
                index.toString(), ['variables.files.$index'])))),
    };

    for (int i = 0; i < photos.length; ++i) {
      var file = await MultipartFile.fromFile(photos[i].path,
          contentType: MediaType('image', photos[i].path.split('.').last));

      map.putIfAbsent(i.toString(), () => file);
    }

    FormData formData = FormData.fromMap(map);

    return _api.postWithFile(formData, token: token);
  }

  Future<dynamic> createProductAd({
    List<dynamic> photos,
    String description,
    List<String> tags,
    String title,
    double price,
    String token,
  }) async {
    var operations = {
      'query': '''
       mutation(\$files: [Upload!]!) {
          createProductAd(
            adInput: {
              title: "$title"
              description: "$description"
              price: $price
              tags: ${tags.toInnerString()}
              photos: \$files
            }
          ) {
            ...productAdFields
          }
        }
      ''' +
          productAdFragment,
      'variables': {'files': List.generate(photos.length, (index) => null)}
    };

    final map = <String, dynamic>{
      'operations': json.encode(operations),
      'map': json.encode(Map()
        ..addEntries(List.generate(
            photos.length,
            (index) => MapEntry<String, List<String>>(
                index.toString(), ['variables.files.$index'])))),
    };

    for (int i = 0; i < photos.length; ++i) {
      var file = await MultipartFile.fromFile(photos[i].path,
          contentType: MediaType('image', photos[i].path.split('.').last));

      map.putIfAbsent(i.toString(), () => file);
    }

    FormData formData = FormData.fromMap(map);

    return _api.postWithFile(formData, token: token);
  }

  Future<dynamic> createServiceAd({
    List<dynamic> photos,
    String description,
    List<String> tags,
    String title,
    double price,
    String token,
  }) async {
    var operations = {
      'query': '''
       mutation(\$files: [Upload!]!) {
          createServiceAd(
            adInput: {
              title: "$title"
              description: "$description"
              priceHour: $price
              tags: ${tags.toInnerString()}
              photos: \$files
            }
          ) {
            ...serviceAdFields
          }
        }
      ''' +
          serviceAdFragment,
      'variables': {'files': List.generate(photos.length, (index) => null)}
    };

    final map = <String, dynamic>{
      'operations': json.encode(operations),
      'map': json.encode(Map()
        ..addEntries(List.generate(
            photos.length,
            (index) => MapEntry<String, List<String>>(
                index.toString(), ['variables.files.$index'])))),
    };

    for (int i = 0; i < photos.length; ++i) {
      var file = await MultipartFile.fromFile(photos[i].path,
          contentType: MediaType('image', photos[i].path.split('.').last));

      map.putIfAbsent(i.toString(), () => file);
    }

    FormData formData = FormData.fromMap(map);

    return _api.postWithFile(formData, token: token);
  }

  Future<dynamic> searchAds(
      {String text,
      DogSize size,
      List<DeliveryStatus> deliveryInfo,
      bool male,
      ActivityLevel activityLevel,
      AnimalType type,
      String creator,
      String token}) async {
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
    }, token: token);
  }

  Future<dynamic> deleteAnimalAd({String id, String token}) async {
    return _api.post({
      'query': '''mutation{
    deleteAnimalAd(id: "$id") {
    id: _id
      
    }
  }'''
    }, token: token);
  }

  Future<dynamic> deleteServiceAd({String id, String token}) async {
    return _api.post({
      'query': '''mutation{
    deleteServiceAd(id: "$id") {
    id: _id
    }
  }'''
    }, token: token);
  }

  Future<dynamic> deleteProductAd({String id, String token}) async {
    return _api.post({
      'query': '''mutation{
    deleteProductAd(id: "$id") {
    id: _id
    }
  }'''
    }, token: token);
  }
}
