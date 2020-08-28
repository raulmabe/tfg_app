import 'package:jumpets_app/data/providers/ads_provider.dart';
import 'package:jumpets_app/data/providers/user_provider.dart';
import 'package:jumpets_app/models/ads/ad.dart';
import 'package:jumpets_app/models/models.dart';
import 'package:jumpets_app/models/wrappers/paginated_ads.dart';
import 'package:built_collection/built_collection.dart';

class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<User> valuateUser(
      {String id, String comment, double value, String token}) async {
    var json = await _userProvider.valuateUser(
      id: id,
      comment: comment,
      value: value,
      token: token,
    );

    return User.fromJson(json['data']['valuateUser']);
  }

  Future<User> updateUser(
      {String name,
      String email,
      String address,
      int phone,
      thumbnail,
      String web,
      String password,
      String token}) async {
    var json = await _userProvider.updateUser(
      name: name,
      email: email,
      password: password,
      thumbnail: thumbnail,
      phone: phone,
      address: address,
      web: web,
      token: token,
    );

    return User.fromJson(json['data']['updateUser']);
  }

  Future<User> getUser({String id}) async {
    var json = await _userProvider.getUser(id: id);

    return User.fromJson(json['data']['getUser']);
  }

  Future<User> removeValuation({String id, String token}) async {
    var json = await _userProvider.removeValuation(id: id, token: token);

    return User.fromJson(json['data']['removeValuation']);
  }
}
