import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Standing {
  String? id;
  String? name;
  String? sp;
  String? wins;
  String? lose;
  String? pts;

  Standing({this.id, this.lose, this.name, this.pts, this.sp, this.wins});
}

class StandingPageController extends GetxController {
  final count = 0.obs;
  List<Standing> standingItems = <Standing>[].obs;
  final isLoading = false.obs;

  void updateLoading(bool value) {
    isLoading.value = value;
    update();
  }

  Stream fecthStanding() async* {
    final url = Uri.parse(
        "https://hbl.fmp.sportradar.com/feeds/en/Europe:Berlin/gismo/standings/5514995");
    List<Standing> temp = <Standing>[];

    final response = await http.get(url);
    // print("response");
    print(json.decode(response.body)["doc"][0]["data"]["standing_main"]);
    List<dynamic> res =
        json.decode(response.body)["doc"][0]["data"]["standing_main"];

    res.forEach((element) {
      temp.add(Standing(
        id: element["_id"].toString(),
        lose: element["looses"].toString(),
        wins: element["wins"].toString(),
        name: element["name"].toString(),
        pts: element["points_pro"].toString(),
        sp: element["played_games"].toString(),
      ));
    });
    standingItems = temp;
    update();
    print(standingItems[0].name);
  }
}
