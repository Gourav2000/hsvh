import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:hsvh/controllers/Business%20Network%20controller/BusinessNetworkController.dart';

class BusinessNetworkHome2 extends StatefulWidget {
  @override
  _BusinessNetworkHomeState createState() => _BusinessNetworkHomeState();
}

class _BusinessNetworkHomeState extends State<BusinessNetworkHome2> {
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
                      SizedBox(height: height * 0.017),
                      // main body
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Individuals",
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
                        height: height * 0.76,
                        child: ListView.builder(
                          itemCount: 26,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                      backgroundImage:
                                          AssetImage("assets/avatar.png"),
                                      radius: 32),
                                  title: Text(
                                    "Wilhe-lm Hartmann",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  subtitle: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: height * 0.01),
                                        child: Image.asset("assets/dhb.png"),
                                      ),
                                      SizedBox(width: width * 0.04),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: height * 0.02),
                                        child: Text(
                                          "Deutscher Handballbund",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              color: Color(0xff4D4D4D)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 1),
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.grey.shade400,
                                  ),
                                )
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
