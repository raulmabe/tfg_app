import 'package:jumpets_app/data/providers/ads_provider.dart';
import 'package:jumpets_app/data/providers/user_provider.dart';
import 'package:jumpets_app/models/ads/ad.dart';
import 'package:jumpets_app/models/chats/message.dart';
import 'package:jumpets_app/models/chats/room.dart';
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

  Future<List<Room>> getRooms({String token}) async {
    var json = await _userProvider.getRooms(token: token);

    List list = json['data']['myRooms'];

    List<Room> rooms = list.map((room) {
      return Room.fromJson(room);
    }).toList();

    return rooms;
  }

  Future<User> updateUser(
      {String name,
      String email,
      String address,
      int phone,
      thumbnail,
      String web,
      String password,
      String token,
      var file}) async {
    var json = await _userProvider.updateUser(
      name: name?.trim(),
      email: email?.trim(),
      password: password?.trim(),
      thumbnail: thumbnail,
      phone: phone,
      address: address?.trim(),
      web: web?.trim(),
      file: file,
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

  Future<Room> sendMessage(
      {String userId, String adId, String text, String token}) async {
    var json = await _userProvider.sendMessage(
        userId: userId, adId: adId, text: text, token: token);

    return Room.fromJson(json['data']['createMessage']);
  }
}
