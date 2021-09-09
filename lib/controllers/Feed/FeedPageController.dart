//@dart=2.9
import 'dart:collection';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hsvh/controllers/Home/HomePageController.dart';
import 'package:http/http.dart' as http;

class FeedPageController extends GetxController {
  final count = 0.obs;
  final isLoading = false.obs;
  List<News> news = <News>[].obs;

  void updateLoading(bool value) {
    isLoading.value = value;
    update();
  }

  Future getAllNews() async {
    final url =
        Uri.parse("https://hsvhbackend.herokuapp.com/api/news/getAllNews");
    final response = await http.get(url);
    List<News> tempnews = [];
    // List<Comments> temcom = [];
    // List<Likes> temlikes = [];
    List<dynamic> responseNews = json.decode(response.body)["news"];
    // List<dynamic> resCom = json.decode(response.body)["news"][0]["comment"];
    // List<dynamic> resLikes = json.decode(response.body)["news"][0]["likes"];
    if (response.statusCode == 201) {
      //news
      responseNews.forEach((element) {
        print(element["likes"]);
        tempnews.add(News(
          newsid: element["_id"],
          title: element["title"],
          image: element["imagelink"],
          body: element["body"],
          comments: (element["comment"] as List<dynamic>)
              .map((item) => Comments(
                    comment: item["content"],
                    commentId: item["_id"],
                    userId: item["authorID"],
                    userName: item["authorName"],
                  ))
              .toList(),
          likes: (element["likes"] as List<dynamic>)
              .map(
                (item) => Likes(
                  likeId: item["_id"],
                  userName: item["userName"],
                  userid: item["userID"],
                ),
              )
              .toList(),
        ));
      });
      news = tempnews;
      // print(news.length);
      // print(news[1].comments!.length);
      // print(news[1].likes!.length);
      update();
    }
  }

  // Future likeCheck(int index, String userId) async
  // {
  //    news[index].likes!.where((element) {
  //                       if (element.userid ==  userId )
  //    }
  // }

  void demoCheck(int index, String newsId, String userId, String userName) {
    List<Likes> check = news[index]
        .likes
        .where((element) => element.userid.contains(userId))
        .toList();
    if (check.length == 0) {
      news[index].likes.add(Likes(
            likeId: "xyz",
            userName: userName,
            userid: userId,
          ));
    } else {
      news[index].likes.remove(check.first);
    }
  }

  Future likeOrDislike(String newsId, String userId, String userName) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('https://hsvhbackend.herokuapp.com/api/news/likeNews'));
    request.body = json.encode({
      "newsID": newsId.toString(),
      "likeBody": {"userID": userId.toString(), "userName": userName.toString()}
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    // if (response.statusCode == 200) {
    //   print(await response.stream.bytesToString());
    // } else {
    //   print(response.reasonPhrase);
    // }
    if (response.statusCode == 201) {
      print(await response.stream.bytesToString());

      update();
    } else {
      print(response.reasonPhrase);
      print("no");
    }
  }
}
