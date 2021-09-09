import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Likes {
  String? userid;
  String? userName;
  String? likeId;
  Likes({this.userid, this.likeId, this.userName});
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
}
