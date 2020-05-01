// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:jumpets_app/models/ads/animal_ad.dart';

import 'package:jumpets_app/models/users/protectora.dart';
import 'package:jumpets_app/models/users/user.dart';
import 'package:http/http.dart' as http;

void main() {
  test('User Decoding', () async {
    var url = 'http://192.168.1.132:5000/graphql';

    var response = await http.post(url, body: {
      'query': ''' query {
    user(id: "dwed"){
      type: __typename
      id
        ... on Protectora {
          web
        }
        ... on Profesional {
          web
        }
      name
      address
      phone
    thumbnail
    }
    protectoras {
      id
      web
      name
      address
      phone
    }
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
      sex
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
    });

    var decodedJson = json.decode(response.body);

    List array = decodedJson['data']['animalsAds'];

    var animalAds =
        array.map((animalAd) => AnimalAd.fromJson(animalAd)).toList();

    /*  CatAd cat = CatAd.fromJson(decodedJson.user);
    String string2 = json.encode(cat.toJson());
    string = json.encode(decodedJson); */

    expect('user', isA<String>());
  });
}
