import 'package:jumpets_app/data/providers/general_provider.dart';
import 'package:jumpets_app/models/models.dart';

class GeneralRepository {
  final GeneralProvider _generalProvider = GeneralProvider();

  Future<List<InfoCardViewModel>> getInfo() async {
    var json = await _generalProvider.getInfo();

    List list = json['data']['info'];

    List<InfoCardViewModel> infoCards = list.map((infoCard) {
      return InfoCardViewModel.fromJson(infoCard);
    }).toList();

    return infoCards;
  }
}
