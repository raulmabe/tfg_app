import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jumpets_app/models/ads/ad.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/models/enums/categories.dart';
import 'package:jumpets_app/redux/actions/actions.dart';
import 'package:jumpets_app/services/api_base_helper.dart';

class JumpetsAPI {
  final ApiBaseHelper _api;

  JumpetsAPI()
      : this._api = ApiBaseHelper(baseUrl: 'http://192.168.1.45:3030/graphql');

  Future<dynamic> getPaginatedAds(
      {Category category, GetPaginatedAds action}) async {
    Completer<dynamic> completer = new Completer();

    var decodedJson = await _api.post({
      'query': ''' query {
    ads(category: $category, first: ${action.first}, after: ${action.after}) {
      totalCount
      edges{
        node{
          id: _id
          tags
          photos(options: {width: ${action.photosWidth}, height: ${action.photosHeight}})
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
            type
            ... on Dog {
              size
            }
          }
          createdAt
          creator {
            id: _id
            type: __typename
            thumbnail(options: {
              width: ${action.thumbnailWidth},
              height: ${action.thumbnailHeight}
            })
            name
            address
            phone
            ... on Protectora {
              web
            }
            ... on Profesional {
              web
            }
          }
        }
        cursor
      }
      pageInfo: {
        hasNextPage
        endCursor
      }
    }
  }'''
    },
        onError: (status, msg) => completer
            .completeError(GotPaginatedAdsError(status: status, msg: msg)));

    List edgesArray = decodedJson['data']['ads']['edges'];

    List<Ad> animalAds = edgesArray.map((edge) {
      print(edge);
      return Ad.fromJson(edge['node']);
    }).toList();

    completer.complete(GotPaginatedAds(
        ads: animalAds,
        hasMore: decodedJson['data']['ads']['pageInfo']['hasNextPage'],
        lastCursor: decodedJson['data']['ads']['pageInfo']['endCursor']));

    return completer.future;
  }
}
