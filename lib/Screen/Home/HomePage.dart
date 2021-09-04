import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hsvh/Singledrawer.dart';
import 'package:hsvh/Vipdrawer.dart';
import 'package:hsvh/controllers/Home/HomePageController.dart';
import 'package:readmore/readmore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageController controller = Get.put(HomePageController());
  bool democheck = true;
  bool latNews = true;

  @override
  void initState() {
    print('hello there');
    super.initState();
  }

  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<HomePageController>(
      builder: (controller) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.grey.shade50,
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey.shade800,
                  ),
                  onPressed: () {}),
            ],
            leading: IconButton(
                icon: Icon(
                  Icons.menu_rounded,
                  color: Colors.grey.shade800,
                ),
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                }),
          ),
          //drawer
          drawer: democheck == false ? CustomDrawer() : CustomVIPDrawer(),
          body: Container(
            height: height,
            width: width,
            color: Colors.grey.shade50,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.025),
                    child: Text(
                      'Live Matches',
                      style: TextStyle(color: controller.headingColor),
                    ),
                  ),
                  SizedBox(
                    width: width,
                    height: height * 0.25,
                    child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                top: height * 0.01,
                                left: width * 0.025,
                                right: width * 0.025),
                            child: Container(
                              height: height,
                              width: width * 0.375,
                              decoration: BoxDecoration(
                                  color: index % 2 == 0
                                      ? Colors.blue
                                      : Colors.indigo.shade900,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: width * 0.025,
                                        right: width * 0.025),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: width * 0.1,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30))),
                                          child: Center(
                                              child: Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Text(
                                              'Live',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: height * 0.0125,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          )),
                                        ),
                                        Spacer(),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.lightGreenAccent,
                                              shape: BoxShape.circle),
                                          height: height * 0.0125,
                                          width: height * 0.0125,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: width * 0.025,
                                        right: width * 0.025,
                                        top: height * 0.015),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: height * 0.06,
                                          width: height * 0.06,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/clogo.png'))),
                                        ),
                                        Spacer(),
                                        Container(
                                          height: height * 0.06,
                                          width: height * 0.06,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/clogo.png'))),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: width * 0.025,
                                        right: width * 0.025,
                                        top: height * 0.03),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Focshe',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        Text(
                                          '0',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: width * 0.025,
                                        right: width * 0.025,
                                        top: height * 0.01),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Focshe',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        Text(
                                          '0',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
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
                  CarouselSlider.builder(
                    itemCount: 5,
                    options: CarouselOptions(
                        height: height * 0.225,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          controller.updateSlideIndex(index);
                          return false;
                        }),
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.02,
                          left: width * 0.025,
                          right: width * 0.025),
                      child: Container(
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 0.5,
                              ),
                            ],
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/screenshot.jpeg'))),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.01),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return index == controller.slideIndex.value
                              ? Container(
                                  width: width * 0.05,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blue,
                                  ),
                                )
                              : Container(
                                  width: width * 0.05,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    //borderRadius: BorderRadius.circular(20),
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                );
                        })),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.025,
                      right: width * 0.025,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Latest News',
                          style: TextStyle(
                              color: controller.headingColor, fontSize: 14),
                        ),
                        Text(
                          "View All",
                          style: TextStyle(
                              color: controller.headingColor, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: latNews == true ? height * 0.36 : height * 0.42,
                    width: width,
                    // decoration: BoxDecoration(border: Border.all()),
                    padding: EdgeInsets.only(top: height * 0.01),
                    child: CarouselSlider.builder(
                        itemCount: 5,
                        options: CarouselOptions(
                            height: height * 0.38,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              controller.updateSlideIndex2(index);
                              return false;
                            }),
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/homepagefinal.png',
                                    height: height * 0.23,
                                    width: width,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 0.6),
                                    child: Text(
                                      'Jim Gottfridson is Bundesliga 2020/2021 MVP',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: ReadMoreText(
                                      'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                                      trimLines: 2,
                                      colorClickableText: Colors.pink,
                                      callback: (val) {
                                        setState(() {
                                          latNews = val;
                                        });
                                      },
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16),
                                      trimMode: TrimMode.Line,
                                      trimCollapsedText: 'Read more',
                                      trimExpandedText: 'Read less',
                                      moreStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade800,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.thumb_up_sharp,
                                              color: Color(0xff0EA2E3),
                                              size: height * 0.025,
                                            ),
                                            SizedBox(width: width * 0.01),
                                            Text(
                                              ' 2,480 Likes',
                                              style: TextStyle(
                                                  color: Color(0xff363636),
                                                  fontSize: height * 0.015),
                                            )
                                          ],
                                        ),
                                        Text(
                                          '158 Comments ',
                                          style: TextStyle(
                                              color: Color(0xff363636),
                                              fontSize: height * 0.015),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.01),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return index == controller.slideIndex2.value
                              ? Container(
                                  width: width * 0.05,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blue,
                                  ),
                                )
                              : Container(
                                  width: width * 0.05,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    //borderRadius: BorderRadius.circular(20),
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                );
                        })),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.025,
                        bottom: height * 0.01,
                        top: height * 0.01,
                        right: width * 0.025),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Upgoing Matches',
                          style: TextStyle(
                              color: controller.headingColor, fontSize: 14),
                        ),
                        Text(
                          "View All",
                          style: TextStyle(
                              color: controller.headingColor, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          height: height * 0.175,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey.shade200,
                                blurRadius: 0.5,
                              ),
                            ],
                            //borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                          child: Container(
                            height: height * 0.2,
                            child: Stack(
                              children: [
                                Positioned(
                                    left: 0.1,
                                    child: Image.asset(
                                      "assets/red.png",
                                      width: width * 0.3,
                                      height: height * 0.1,
                                      fit: BoxFit.fill,
                                    )),
                                Positioned(
                                    left: width * 0.1,
                                    top: height * 0.016,
                                    child: Column(
                                      children: [
                                        Image.asset("assets/iconcastle.png"),
                                        Text(
                                          "HAMBURG",
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    )),
                                Positioned(
                                    right: 0.1,
                                    child: Image.asset(
                                      "assets/blue.png",
                                      width: width * 0.3,
                                      height: height * 0.097,
                                      fit: BoxFit.fill,
                                    )),
                                Positioned(
                                    right: width * 0.1,
                                    top: height * 0.016,
                                    child: Column(
                                      children: [
                                        Image.asset("assets/team2.png"),
                                        Text(
                                          "MAGDEBURG",
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    )),
                                Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "7H : 48M Left",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: height * 0.027),
                                      InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                              "assets/checkOut.png"))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
