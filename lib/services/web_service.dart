import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jumpets_app/models/ads/animal_ad.dart';
import 'package:jumpets_app/redux/actions/actions.dart';
import 'package:jumpets_app/services/api_base_helper.dart';

class JumpetsAPI {
  final ApiBaseHelper _api;

  JumpetsAPI()
      : this._api = ApiBaseHelper(baseUrl: 'http://192.168.1.133:5000/graphql');

  Future<GotAnimalAds> getAnimalAds({Completer actionCompleter}) async {
    Completer<GotAnimalAds> completer = new Completer();

    var decodedJson = await _api.post({
      'query': ''' query {
    animalsAds {
      type: __typename
      id
      date
      tags
      photos
      owner {
      type: __typename
        thumbnail
        id
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
      }

    }
  }'''
    },
        onError: () =>
            completer.completeError(GotAnimalAds(ads: null, error: '')));

    List array = decodedJson['data']['animalsAds'];

    List<AnimalAd> animalAds =
        array.map((animalAd) => AnimalAd.fromJson(animalAd)).toList();

    completer.complete(GotAnimalAds(ads: animalAds, error: null));

    return completer.future;
  }
/* 
  Future<GotAnimalAds> getAnimalAds({Completer actionCompleter}) async {
    Completer<GotAnimalAds> completer = new Completer();

    http.post(_api.baseUrl, body: {
      'query': ''' query {
    animalsAds {
      type: __typename
      id
      date
      tags
      photos
      owner {
      type: __typename
        thumbnail
        id
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
      }

    }
  }'''
    }).then((http.Response response) {
      actionCompleter?.complete();

      if (response.statusCode == 200) {
        var decodedJson = json.decode(response.body);

        List array = decodedJson['data']['animalsAds'];

        List<AnimalAd> animalAds =
            array.map((animalAd) => AnimalAd.fromJson(animalAd)).toList();

        completer.complete(GotAnimalAds(ads: animalAds, error: null));
      } else {
        completer.completeError(GotAnimalAds(ads: null, error: response.body));
      }
    });

    return completer.future;
  } */
}
