import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:hsvh/BusinessNetwork/BusAddidas.dart';
import 'package:hsvh/BusinessNetwork/BusNetProfile.dart';
import 'package:hsvh/BusinessNetwork/BusinessNetworkHome.dart';
import 'package:hsvh/BusinessNetwork/BusinessNetworkHome2.dart';
import 'package:hsvh/BusinessNetwork/BussSearch.dart';
import 'package:hsvh/controllers/Business%20Network%20controller/BusinessNetworkController.dart';

class ShopPageNew extends StatefulWidget {
  const ShopPageNew({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPageNew> {
  final BusinessNetworkController controller =
      Get.put(BusinessNetworkController());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GetBuilder<BusinessNetworkController>(builder: (controller) {
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
                'Network',
                style: TextStyle(
                    color: Color(0xff1E2022),
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
              Spacer(
                flex: 3,
              )
            ],
          ),
        ),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowGlow();
            return true;
          },
          child: Container(
            height: height,
            width: width,
            color: Colors.grey.shade100,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: width * 0.03,
                  right: width * 0.03,
                ),
                child: Column(
                  children: [
                    TextField(
                      enableInteractiveSelection:
                          false, // will disable paste operation
                      readOnly: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none),
                        fillColor: Colors.white,
                        filled: true,
                        hoverColor: Colors.white,
                        focusColor: Colors.white,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BusinessSearch()));
                        print("object");
                      },
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
                            top: height * 0.02, left: 5, right: 5),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Addidas()));
                          },
                          child: Container(
                              width: width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 0.5,
                                  ),
                                ],
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage('assets/adidas.png'))),
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.01),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            return index == controller.slideIndex.value
                                ? Container(
                                    width: width * 0.07,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue,
                                    ),
                                  )
                                : Container(
                                    width: width * 0.07,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      //borderRadius: BorderRadius.circular(20),
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                    ),
                                  );
                          })),
                    ),
                    Container(
                      height: height * 0.06,
                      width: double.infinity,
                      padding: EdgeInsets.only(top: height * 0.01),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.updateSelectedFeild(0);
                            },
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: controller.selectedFeild.value == 0
                                      ? Color(0xff002B7A)
                                      : Colors.grey.shade50,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Text(
                                'Consumer Goods Company',
                                style: TextStyle(
                                    color: controller.selectedFeild.value == 0
                                        ? Colors.white
                                        : Color(0xff002B7A),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.updateSelectedFeild(1);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: controller.selectedFeild.value == 1
                                      ? Color(0xff002B7A)
                                      : Colors.grey.shade50,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Sporting Company',
                                  style: TextStyle(
                                      color: controller.selectedFeild.value == 1
                                          ? Colors.white
                                          : Color(0xff002B7A),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.updateSelectedFeild(2);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: controller.selectedFeild.value == 2
                                      ? Color(0xff002B7A)
                                      : Colors.grey.shade50,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Trending',
                                  style: TextStyle(
                                      color: controller.selectedFeild.value == 2
                                          ? Colors.white
                                          : Color(0xff002B7A),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.updateSelectedFeild(3);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: controller.selectedFeild.value == 3
                                      ? Color(0xff002B7A)
                                      : Colors.grey.shade50,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Recommended',
                                  style: TextStyle(
                                      color: controller.selectedFeild.value == 3
                                          ? Colors.white
                                          : Color(0xff002B7A),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    customRow("Consumer Goods Company"),
                    SizedBox(height: height * 0.025),
                    Container(
                      height: height * 0.28,
                      width: double.infinity,
                      child: GridView.builder(
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, crossAxisSpacing: 0.4),
                        itemBuilder: (context, index) {
                          return customGoodCompany1(width, height);
                        },
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    // SizedBox(height: height * 0.012),
                    // customGoodCompany2(width),
                    // SizedBox(height: height * 0.020),
                    // customRow("People you can conneect with"),
                    // SizedBox(height: height * 0.020),
                    customRow("People you can conneect with"),
                    SizedBox(height: height * 0.025),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.012),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: members("Wilhe-lma", "President", width,
                                  context, height)),
                          Expanded(
                              child: members("Petra Merkel", "Auditing Clerk",
                                  width, context, height)),
                          Expanded(
                              child: members("Andreas Scheuer",
                                  "UX/UI Designer", width, context, height)),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget customRow(String text1) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text1,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14)),
          InkWell(
            onTap: () {
              text1 == "Consumer Goods Company"
                  ? Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BusinessNetworkHome()))
                  : Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BusinessNetworkHome2()));
            },
            child: Text(
              "View All",
              style: TextStyle(
                  fontWeight: FontWeight.w300, color: Color(0xfff0EA2E3)),
            ),
          )
        ],
      ),
    );
  }
}

Widget customGoodCompany1(double width, double height) {
  return Container(
    width: width,
    child: Row(
      children: [
        Column(
          children: [
            Container(
                height: height * 0.086,
                width: width * 0.23,
                child: Image.asset("assets/businessNetwork.png",
                    fit: BoxFit.cover)),
            SizedBox(height: height * 0.001),
            Container(
              width: width * 0.3,
              height: height * 0.048,
              child: FittedBox(
                child: Text(
                  "Emmerich-Kassulke",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}

Widget customGoodCompany2(double width) {
  return Container(
    width: double.infinity,
    child: Row(
      children: [
        Column(
          children: [
            Image.asset("assets/businessNetwork.png"),
            SizedBox(height: 3),
            Text("Emmerich-Kassulke",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600))
          ],
        ),
        SizedBox(width: width * 0.032),
        Column(
          children: [
            Image.asset("assets/businessNetwork.png"),
            SizedBox(height: 3),
            Text("Emmerich-Kassulke",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600))
          ],
        ),
        SizedBox(width: width * 0.032),
        Column(
          children: [
            Image.asset("assets/businessNetwork.png"),
            SizedBox(height: 3),
            Text("Emmerich-Kassulke",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600))
          ],
        ),
      ],
    ),
  );
}

Widget members(String text1, String text2, double width, BuildContext context,
    double height) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BusinessNetworkProfile(),
      ));
    },
    child: Container(
      width: width * 0.26,
      height: height * 0.17,
      child: Column(
        children: [
          CircleAvatar(
            child: Image.asset(
              "assets/busNet2.png",
              fit: BoxFit.cover,
            ),
            radius: 35,
          ),
          Container(
            height: height * 0.032,
            child: Text(text1,
                overflow: TextOverflow.fade,
                style: TextStyle(
                    color: Color(0xff363636), fontWeight: FontWeight.w600),
                maxLines: 1),
          ),
          Container(
              child: Text(
            text2,
            style: TextStyle(color: Color(0xff4D4D4D)),
            maxLines: 1,
          ))
        ],
      ),
    ),
  );
}
