import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsvh/controllers/Feed/FeedPageController.dart';
import 'package:readmore/readmore.dart';
import 'PostPage.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final FeedPageController controller = Get.put(FeedPageController());

  void likesSheet() async {
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
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/avatar.png"),
                                  radius: 22),
                              title: Text(
                                "Wilhe-lm Hartmann",
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<FeedPageController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade50,
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
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
        body: Container(
          height: height,
          width: width,
          color: Colors.grey.shade50,
          child: SingleChildScrollView(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 15,
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
                                        builder: (context) => PostPage()));
                              },
                              child: Image.asset(
                                'assets/screenshot.jpeg',
                                height: height * 0.375 * 0.6,
                                width: width,
                                fit: BoxFit.cover,
                              )),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.025,
                                right: width * 0.025,
                                top: height * 0.0175),
                            child: SizedBox(
                                width: width,
                                height: height * 0.375 * 0.075,
                                child: Text(
                                  'Jim Gottfridson is Bundesliga 2020/2021 MVP',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: height * 0.375 * 0.0475),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.025, right: width * 0.025),
                            child: ReadMoreText(
                              'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                              trimLines: 2,
                              colorClickableText: Colors.pink,
                              style: TextStyle(color: Colors.grey.shade600),
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Read more',
                              trimExpandedText: 'Read less',
                              moreStyle:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10,
                                left: width * 0.025,
                                right: width * 0.025),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // likes showing modal bottom sheet
                                InkWell(
                                  onTap: () {
                                    likesSheet();
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.thumb_up_sharp,
                                        color: Colors.blue,
                                        size: height * 0.02,
                                      ),
                                      Text(
                                        ' 2,480 Likes',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: height * 0.0125),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  '158 Comments ',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: height * 0.0125),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.025, right: width * 0.025),
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
                                Row(
                                  children: [
                                    Icon(
                                      Icons.thumb_up_outlined,
                                      color: Colors.grey.shade700,
                                      size: height * 0.02,
                                    ),
                                    Text(
                                      ' Like',
                                      style: TextStyle(
                                          color: Colors.grey.shade700),
                                    )
                                  ],
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
