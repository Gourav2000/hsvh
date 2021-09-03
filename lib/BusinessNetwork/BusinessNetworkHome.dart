import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:hsvh/controllers/Business%20Network%20controller/BusinessNetworkController.dart';

class BusinessNetworkHome extends StatefulWidget {
  @override
  _BusinessNetworkHomeState createState() => _BusinessNetworkHomeState();
}

class _BusinessNetworkHomeState extends State<BusinessNetworkHome> {
  final BusinessNetworkController controller =
      Get.put(BusinessNetworkController());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GetBuilder<BusinessNetworkController>(builder: (controller) {
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
                    left: width * 0.05,
                    right: width * 0.05,
                  ),
                  child: Column(
                    children: [
                      TextField(
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
                      ),
                      Container(
                        height: height * 0.0800,
                        width: double.infinity,
                        padding:
                            EdgeInsets.only(top: height * 0.018, bottom: 8),
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
                                        color:
                                            controller.selectedFeild.value == 1
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
                                        color:
                                            controller.selectedFeild.value == 2
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
                                        color:
                                            controller.selectedFeild.value == 3
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
                      SizedBox(height: height * 0.017),
                      // main body
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Consumer Goods Company",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff222222))),
                          Text("26 listed",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff222222)))
                        ],
                      ),
                      SizedBox(height: height * 0.009),
                      Container(
                        height: height * 0.72,
                        child: ListView.builder(
                          itemCount: 26,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 9, bottom: 6),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset("assets/businessNetwork.png"),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: width * 0.05),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Emmerich-Kassulke",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15),
                                            ),
                                            SizedBox(height: height * 0.006),
                                            Text(
                                              "Headquaters",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15),
                                            ),
                                            SizedBox(height: height * 0.008),
                                            Text(
                                              "Herzogenaurach",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: Color(0xff4D4D4D)),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(color: Color(0xff000000)),
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
