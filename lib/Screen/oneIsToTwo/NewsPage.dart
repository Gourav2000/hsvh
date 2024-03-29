import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsvh/controllers/Feed/FeedPageController.dart';
import 'package:hsvh/controllers/Home/HomePageController.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';
import 'PostPage.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final FeedPageController controller1 = Get.put(FeedPageController());
  bool democheck = true;
  bool latNews = true;

  void likesSheet(BuildContext context, List<Likes> likes) async {
    await showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(25.0),
                topRight: const Radius.circular(25.0),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 30),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("People who have liked this",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400)),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.close))
                        ])),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21.0),
                  child: Divider(thickness: 1, color: Colors.black87),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 21.0),
                  height: MediaQuery.of(context).size.height * 0.668,
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overscroll) {
                      overscroll.disallowGlow();
                      return true;
                    },
                    child: likes.length == 0
                        ? Center(
                            child: Text(
                            "No Likes",
                            style: TextStyle(fontSize: 32),
                          ))
                        : ListView.builder(
                            itemCount: likes.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                        backgroundImage:
                                            AssetImage("assets/avatar.png"),
                                        radius: 22),
                                    title: Text(
                                      likes[index].userName!,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    subtitle: Text(
                                      "Deutscher Handballbund",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xff4D4D4D)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 27),
                                    child: Divider(
                                      thickness: 1,
                                      color: Colors.grey.shade400,
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    controller1.updateLoading(true);
    controller1.getAllNews().then((value) => controller1.updateLoading(false));
  }

  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser!.uid);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GetBuilder<FeedPageController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade50,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Row(
            children: [
              Spacer(
                flex: 2,
              ),
              Text(
                'Feed',
                style: TextStyle(color: Colors.black),
              ),
              Spacer(
                flex: 3,
              )
            ],
          ),
        ),
        body: controller.isLoading.value == true
            ? Center(child: CircularProgressIndicator())
            : Container(
                height: height,
                width: width,
                color: Colors.grey.shade50,
                child: SingleChildScrollView(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.news.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: height * 0.025),
                          child: Container(
                            width: width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.grey.shade200,
                                  blurRadius: 0.5,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PostPage(
                                                  news: controller.news[index],
                                                )));
                                  },
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        controller.news[index].image ?? "",
                                    placeholder: (context, fgf) {
                                      return Shimmer.fromColors(
                                          highlightColor: Colors.grey[400]!,
                                          baseColor: Colors.white,
                                          child: ShimmerLoadingnew());
                                    },
                                    height: height * 0.23,
                                    width: width,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: width * 0.025,
                                      right: width * 0.025,
                                      top: height * 0.0175),
                                  child: SizedBox(
                                      width: width,
                                      height: height * 0.375 * 0.075,
                                      child: Text(
                                        controller.news[index].title!,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: height * 0.375 * 0.0475),
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: width * 0.025,
                                      right: width * 0.025),
                                  child: ReadMoreText(
                                    controller.news[index].body!,
                                    trimLines: 2,
                                    colorClickableText: Colors.pink,
                                    style:
                                        TextStyle(color: Colors.grey.shade600),
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: 'Read more',
                                    trimExpandedText: 'Read less',
                                    moreStyle: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 12, right: 12, top: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // likes showing modal bottom sheet
                                      InkWell(
                                        onTap: () {
                                          likesSheet(context,
                                              controller.news[index].likes!);
                                        },
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.thumb_up,
                                              color: Colors.blue,
                                              size: height * 0.02,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              controller
                                                      .news[index].likes!.length
                                                      .toString() +
                                                  " Likes",
                                              style: TextStyle(
                                                  color: Color(0xff363636),
                                                  fontSize: height * 0.015),
                                            )
                                          ],
                                        ),
                                      ),
                                      Text(
                                        controller.news[index].comments!.length
                                                .toString() +
                                            ' Comments',
                                        style: TextStyle(
                                            color: Color(0xff363636),
                                            fontSize: height * 0.015),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: width * 0.025,
                                      right: width * 0.025),
                                  child: Divider(
                                    color: Colors.grey.shade900,
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: width * 0.075,
                                      right: width * 0.075,
                                      bottom: height * 0.01),
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          // var changeLike = controller
                                          //     .news[index].likes!
                                          //     .where((element) {
                                          //   if (element.userid ==
                                          //       FirebaseAuth.instance
                                          //           .currentUser!.uid) {
                                          //     return true;
                                          //   } else {
                                          //     return false;
                                          //   }
                                          // });
                                          // changeLike.length != 0
                                          //     ? controller.news[index].likes!
                                          //         .remove(changeLike.first)
                                          // : controller.news[index].likes!
                                          //     .add(Likes(
                                          //     likeId: "dsds",
                                          //     userName: FirebaseAuth
                                          //         .instance
                                          //         .currentUser!
                                          //         .displayName,
                                          //     userid: FirebaseAuth.instance
                                          //         .currentUser!.uid,
                                          //   ));
                                          controller.demoCheck(
                                              index,
                                              controller.news[index].newsid!,
                                              FirebaseAuth
                                                  .instance.currentUser!.uid,
                                              FirebaseAuth.instance.currentUser!
                                                  .displayName!);
                                          setState(() {});
                                          await controller.likeOrDislike(
                                            controller.news[index].newsid!,
                                            FirebaseAuth
                                                .instance.currentUser!.uid,
                                            FirebaseAuth.instance.currentUser!
                                                .displayName!,
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            controller.news[index].likes!
                                                        .where((element) {
                                                      if (element.userid ==
                                                          FirebaseAuth
                                                              .instance
                                                              .currentUser!
                                                              .uid) {
                                                        return true;
                                                      } else {
                                                        return false;
                                                      }
                                                    }).length !=
                                                    0
                                                ? Icon(
                                                    Icons.thumb_up,
                                                    color: Color(0xff0EA2E3),
                                                    size: height * 0.02,
                                                  )
                                                : Icon(
                                                    Icons.thumb_up_outlined,
                                                    color: Colors.grey.shade600,
                                                    size: height * 0.02,
                                                  ),
                                            controller.news[index].likes!
                                                        .where((element) {
                                                      if (element.userid ==
                                                          FirebaseAuth
                                                              .instance
                                                              .currentUser!
                                                              .uid) {
                                                        return true;
                                                      } else {
                                                        return false;
                                                      }
                                                    }).length !=
                                                    0
                                                ? Text(
                                                    ' Like',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff0EA2E3)),
                                                  )
                                                : Text(
                                                    ' Like',
                                                    style: TextStyle(
                                                        color: Colors
                                                            .grey.shade700),
                                                  )
                                          ],
                                        ),
                                      ),
                                      Spacer(
                                        flex: 3,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.comment,
                                            color: Colors.grey.shade700,
                                            size: height * 0.02,
                                          ),
                                          Text(
                                            ' Comment',
                                            style: TextStyle(
                                                color: Colors.grey.shade700),
                                          )
                                        ],
                                      ),
                                      Spacer(
                                        flex: 2,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            color: Colors.grey.shade700,
                                            size: height * 0.02,
                                          ),
                                          Text(
                                            ' 7 hrs Ago',
                                            style: TextStyle(
                                                color: Colors.grey.shade700),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
      );
    });
  }
}

class ShimmerLoadingnew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }
}
