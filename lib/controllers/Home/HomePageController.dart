import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Likes {
  String? userid;
  Likes({this.userid});
}

class Comments {
  String? userId;
  String? commentId;
  String? comment;
  String? userName;
  Comments({this.comment, this.commentId, this.userId, this.userName});
}

class News {
  String? newsid;
  String? image;
  String? title;
  String? body;
  List<Likes>? likes;
  List<Comments>? comments;
  News({
    this.newsid,
    this.image,
    this.likes,
    this.title,
    this.body,
    this.comments,
  });
}

class HomePageController extends GetxController {
  final count = 0.obs;
  final slideIndex = 0.obs;
  final slideIndex2 = 0.obs;
  final headingColor = Colors.grey.shade600;
  final isLoading = false.obs;
  List<News> news = <News>[].obs;
  String? userId;

  void updateLoading(bool value) {
    isLoading.value = value;
    update();
  }

  void updateSlideIndex(int index) {
    slideIndex.value = index;
    update();
  }

  void updateSlideIndex2(int index) {
    slideIndex2.value = index;
    update();
  }

  Future getAllNews() async {
    final url =
        Uri.parse("https://hsvh-backend.herokuapp.com/api/news/getAllNews");
    final response = await http.get(url);
    List<News> tempnews = [];
    // List<Comments> temcom = [];
    // List<Likes> temlikes = [];
    List<dynamic> responseNews = json.decode(response.body)["news"];
    // List<dynamic> resCom = json.decode(response.body)["news"][0]["comment"];
    // List<dynamic> resLikes = json.decode(response.body)["news"][0]["likes"];
    if (response.statusCode == 201) {
      // print(json.decode(response.body)["news"]);
      // print(json.decode(response.body)["news"][0]["comment"]);
      // print(json.decode(response.body)["news"][0]["likes"]);
//comments
      // resCom.forEach((element) {
      //   print(element);
      //   temcom.add(Comments(
      //     commentId: element["_id"],
      //     comment: element["content"],
      //     userId: element["authorID"],
      //     userName: element["authorName"],
      //   ));
      // });

      // //likes
      // resLikes.forEach((element) {
      //   print(element);
      //   temlikes.add(Likes(
      //     userid: element,
      //   ));
      // });

      //news
      responseNews.forEach((element) {
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
                  userid: item,
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

  Future fetchUserId() async {
    print(" wrong");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("userId")) {
      print("pref wrong");
      return;
    } else {
      print("pref right");
      final token = prefs.getString("userId");
      userId = token;
      // print(userId);
      update();
    }
  }

  userIdSave(String userId) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      "userId",
      userId,
    );
  }
}
