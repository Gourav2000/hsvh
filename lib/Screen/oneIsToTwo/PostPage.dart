import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hsvh/Screen/Home/HomePage.dart';
import 'package:hsvh/controllers/Feed/PostPageController.dart';
import 'package:get/get.dart';
import 'package:hsvh/controllers/Home/HomePageController.dart';
import 'package:shimmer/shimmer.dart';

class PostPage extends StatefulWidget {
  final News? news;
  PostPage({this.news});

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final PostPageController controller = Get.put(PostPageController());
  void likesSheet(BuildContext context, List<Likes>? likes) async {
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
                    child: ListView.builder(
                      itemCount: likes!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/avatar.png"),
                                  radius: 22),
                              title: Text(
                                likes[index].userName.toString(),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 27),
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
  Widget build(BuildContext context) {
    print(widget.news!.body.toString());
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<PostPageController>(builder: (controller) {
      return Scaffold(
        body: Container(
          height: height,
          width: width,
          color: Colors.grey.shade50,
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: widget.news!.image ?? "",
                placeholder: (context, fgf) {
                  return Shimmer.fromColors(
                      highlightColor: Colors.grey[400]!,
                      baseColor: Colors.white,
                      child: ShimmerLoadingnew());
                },
                height: height * 0.5,
                width: width,
                fit: BoxFit.fill,
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: width,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: height * 0.05, left: 20, right: 20),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    //width: width*0.075,
                                    height: width * 0.08,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 7.0,
                                          left: 7,
                                          right: 2,
                                          bottom: 7),
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        size: height * 0.0225,
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  //width: width*0.075,
                                  height: width * 0.08,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 7.0, left: 7, right: 7, bottom: 7),
                                    child: Icon(
                                      Icons.share_outlined,
                                      size: height * 0.0225,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.2,
                          ),
                          Row(
                            children: [
                              Spacer(),
                              Column(
                                children: [
                                  Container(
                                    height: height * 0.0425,
                                    width: width * 0.3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color: Color(0xff0EA2E3)),
                                    child: InkWell(
                                      onTap: () {
                                        likesSheet(context, widget.news!.likes);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.thumb_up_alt_outlined,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: width * 0.02),
                                          Text(
                                            widget.news!.likes!.length
                                                    .toString() +
                                                " Likes",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Container(
                                    height: height * 0.0425,
                                    width: width * 0.4,
                                    margin:
                                        EdgeInsets.only(right: width * 0.017),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color: Color(0xff0EA2E3)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.comment_outlined,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: width * 0.02),
                                        Text(
                                          widget.news!.comments!.length
                                                  .toString() +
                                              " Comments",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
              Positioned(
                  top: height * 0.4,
                  left: 0,
                  child: Container(
                    height: height * 0.6,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      boxShadow: <BoxShadow>[],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.05),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: height * 0.025,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    '27 June,  Saturday',
                                    style: TextStyle(
                                        color: Color(0xff363636),
                                        fontSize: height * 0.0180),
                                  ),
                                  SizedBox(
                                    width: width * 0.015,
                                  ),
                                  Text(
                                    '| 9:00 am',
                                    style: TextStyle(
                                        color: Color(0xff363636),
                                        fontSize: height * 0.0180),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.015),
                              child: Text(
                                widget.news!.title.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: height * 0.46 * 0.06),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.011),
                              child: Text(
                                'Description',
                                //overflow:TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Color(0xff363636),
                                    //fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600,
                                    fontSize: height * 0.4 * 0.065 * 0.9),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: height * 0.010, right: width * 0.02),
                              child: Text(
                                widget.news!.body.toString(),
                                style: TextStyle(
                                    color: Color(0xff4D4D4D),
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w400,
                                    fontSize: height * 0.4 * 0.057 * 0.9),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      );
    });
  }
}
