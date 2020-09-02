import 'package:jumpets_app/data/providers/ads_provider.dart';
import 'package:jumpets_app/models/ads/ad.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/models/wrappers/paginated_ads.dart';
import 'package:built_collection/built_collection.dart';

class AdsRepository {
  final AdsProvider _adsProvider = AdsProvider();

  Future<List<Ad>> searchAds(
      {String text,
      DogSize size,
      List<DeliveryStatus> deliveryInfo,
      bool male,
      ActivityLevel activityLevel,
      AnimalType type,
      String creator}) async {
    var json = await _adsProvider.searchAds(
        text: text,
        creator: creator,
        size: size,
        deliveryInfo: deliveryInfo,
        male: male,
        type: type,
        activityLevel: activityLevel);

    List list1 = json['data']['searchAds1'];
    List list2 = json['data']['searchAds2'];
    List list3 = json['data']['searchAds3'];

    List<Ad> ads1 = list1.map((ad) {
      return Ad.fromJson(ad);
    }).toList();

    List<Ad> ads2 = list2.map((ad) {
      return Ad.fromJson(ad);
    }).toList();

    List<Ad> ads3 = list3.map((ad) {
      return Ad.fromJson(ad);
    }).toList();

    List<Ad> ads = List.from(ads1);

    ads2.removeWhere((element) => ads.any((ad) => ad.id == element.id));
    ads.addAll(ads2);

    ads3.removeWhere((element) => ads.any((ad) => ad.id == element.id));
    ads.addAll(ads3);
    return ads;
  }

  Future<PaginatedAds> getPaginatedAds(
      {Category category,
      int first,
      String after,
      int photosWidth,
      int photosHeight,
      int thumbnailWidth,
      int thumbnailHeight}) async {
    var json = await _adsProvider.getPaginatedAds(
        category: category,
        first: first,
        after: after,
        photosHeight: photosHeight,
        photosWidth: photosWidth,
        thumbnailHeight: thumbnailHeight,
        thumbnailWidth: thumbnailWidth);

    List edgesArray = json['data']['ads']['edges'];

    List<Ad> ads = edgesArray.map((edge) {
      return Ad.fromJson(edge['node']);
    }).toList();

    return PaginatedAds((b) => b
      ..ads = BuiltList<Ad>(ads).toBuilder()
      ..pageInfo = PageInfo((p) => p
        ..endCursor = json['data']['ads']['pageInfo']['endCursor']
        ..hasNextPage = json['data']['ads']['pageInfo']['hasNextPage']
        ..hasPreviousPage = json['data']['ads']['pageInfo']['hasPreviousPage']
        ..startCursor =
            json['data']['ads']['pageInfo']['startCursor']).toBuilder());
  }

  Future<List<Protectora>> getCloseShelters({String token}) async {
    var json = await _adsProvider.getCloseShelters(token: token);

    List sheltersList = json['data']['getCloseShelters'];

    List<Protectora> shelters = sheltersList.map((node) {
      return Protectora.fromJson(node['protectora']).rebuild((b) => b
        ..distance = node['distance']
        ..travelTime = node['travelTime']);
    }).toList();

    return shelters;
  }

  Future<List<Ad>> getFavs({String token}) async {
    var json = await _adsProvider.getFavs(token: token);

    List list = json['data']['savedAds'];

    List<Ad> favs = list.map((ad) {
      return Ad.fromJson(ad);
    }).toList();

    return favs;
  }

  Future<List<Ad>> saveAd({String token, String id}) async {
    var json = await _adsProvider.saveAd(token: token, id: id);

    List list = json['data']['saveAd'];

    List<Ad> favs = list.map((ad) {
      return Ad.fromJson(ad);
    }).toList();

    return favs;
  }

  Future<List<Ad>> unsaveAd({String token, String id}) async {
    var json = await _adsProvider.unsaveAd(token: token, id: id);

    List list = json['data']['unsaveAd'];

    List<Ad> favs = list.map((ad) {
      return Ad.fromJson(ad);
    }).toList();

    return favs;
  }

  Future<Ad> createAnimalAd(
      {List<dynamic> photos,
      String description,
      List<String> tags,
      String name,
      String mustKnow,
      String breed,
      double weight,
      double adoptionTax,
      List<String> personality,
      DateTime birthDate,
      List<DeliveryStatus> deliveryInfo,
      bool male,
      ActivityLevel activityLevel,
      AnimalType type,
      String token}) async {
    var json = await _adsProvider.createAnimalAd(
        photos: photos,
        description: description,
        tags: tags,
        name: name,
        mustKnow: mustKnow,
        breed: breed,
        weight: weight,
        adoptionTax: adoptionTax,
        personality: personality,
        birthDate: birthDate,
        deliveryInfo: deliveryInfo,
        male: male,
        activityLevel: activityLevel,
        type: type,
        token: token);

    return Ad.fromJson(json['data']['createAnimalAd']);
  }

  Future<Ad> createProductAd({String token, String id}) async {
    var json = await _adsProvider.saveAd(token: token, id: id);

    return Ad.fromJson(json['data']['createAnimalAd']);
  }
}
