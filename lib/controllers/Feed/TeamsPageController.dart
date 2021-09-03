import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Team {
  String? id;
  String? playerFirstName;
  String? playerLastName;
  String? playerPosition;
  String? age;
  String? playerNumber;
  String? goals;
  String? matches;
  String? weight;
  String? height;
  Team(
      {this.id,
      this.playerFirstName,
      this.playerLastName,
      this.playerPosition,
      this.age,
      this.playerNumber,
      this.goals,
      this.matches,
      this.height,
      this.weight});
}

class TeamsPageController extends GetxController {
  final count = 0.obs;
  final selectedFeild = 0.obs;
  List<Team> teamMembers = <Team>[].obs;
  final isLoading = false.obs;

  void updateSelectedFeild(int index) {
    selectedFeild.value = index;
    update();
  }

  void updateLoading(bool value) {
    isLoading.value = value;
    update();
  }

  Future fecthTeam(String playerPos) async {
    final url = Uri.parse(
        "https://hbl.fmp.sportradar.com/feeds/en/Europe:Berlin/gismo/team_info/149/55149/3980");
    List<Team> temp = <Team>[];

    final response = await http.get(url);
    print("response");
    print(json.decode(response.body)["doc"][0]["data"]["team_info"]["squad"]);
    List<dynamic> res =
        json.decode(response.body)["doc"][0]["data"]["team_info"]["squad"];

    res.forEach((element) {
      if (playerPos == element["player_position"]) {
        temp.add(Team(
          id: element["_id"].toString(),
          playerFirstName: element["player_firstname"],
          playerLastName: element["player_lastname"],
          playerPosition: element["player_position"],
          age: element["age"].toString(),
          playerNumber: element["player_number"].toString(),
          goals: element["goals"].toString(),
          matches: element["matches"].toString(),
          height: element["height"].toString(),
          weight: element["weight"].toString(),
        ));
      }
    });
    teamMembers = temp;
    update();
    // print(teamMembers[0].playerFirstName);
  }

  Team selectPlayer(String id) {
    return teamMembers.firstWhere((element) => element.id!.contains(id));
  }
}
