import 'package:jumpets_app/data/providers/ads_provider.dart';
import 'package:jumpets_app/models/ads/ad.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/models/wrappers/paginated_ads.dart';
import 'package:built_collection/built_collection.dart';

class AdsRepository {
  final AdsProvider _adsProvider = AdsProvider();

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
}
