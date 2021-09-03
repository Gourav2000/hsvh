import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:hsvh/controllers/Business%20Network%20controller/BusinessNetworkController.dart';

class BusinessNetworkProfile extends StatefulWidget {
  const BusinessNetworkProfile({Key? key}) : super(key: key);

  @override
  _BusinessNetworkProfileState createState() => _BusinessNetworkProfileState();
}

class _BusinessNetworkProfileState extends State<BusinessNetworkProfile> {
  final BusinessNetworkController controller =
      Get.put(BusinessNetworkController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
          // on select share
          actions: [
            InkWell(
                onTap: () async {
                  await showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.85,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 21.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Select contacts to share with",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400)),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            icon: Icon(Icons.close))
                                      ])),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 21.0),
                                child: Divider(
                                    thickness: 1, color: Colors.black87),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 21.0,
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.725,
                                child: NotificationListener<
                                    OverscrollIndicatorNotification>(
                                  onNotification: (overscroll) {
                                    overscroll.disallowGlow();
                                    return true;
                                  },
                                  child: Stack(
                                    children: [
                                      ListView.builder(
                                        itemCount: 20,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              // change
                                              print("test1");
                                              controller.changePro();
                                            },
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  leading: CircleAvatar(
                                                      backgroundImage: AssetImage(
                                                          "assets/avatar.png"),
                                                      radius: 22),
                                                  title: Text(
                                                    "Wilhe-lm Hartmann",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  subtitle: Text(
                                                    "Deutscher Handballbund",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xff4D4D4D)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 27),
                                                  child: Divider(
                                                    thickness: 1,
                                                    color: Colors.grey.shade400,
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      controller.check.value == true
                                          ? Positioned(
                                              bottom: height * 0.008,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          elevation: 0,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      width *
                                                                          0.26,
                                                                  vertical:
                                                                      height *
                                                                          0.018),
                                                          shape:
                                                              StadiumBorder(),
                                                          primary: Color(
                                                              0xff002B7A)),
                                                  onPressed: () {},
                                                  child: Text(
                                                    "SHARE PROFILE",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 18),
                                                  )),
                                            )
                                          : Container()
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Image.asset("assets/share.png")),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height * 0.48,
                  width: double.infinity,
                  decoration: BoxDecoration(border: Border.all()),
                  margin: EdgeInsets.symmetric(horizontal: width * 0.040),
                  child: Column(
                    children: [
                      Container(
                        height: height * 0.21,
                        width: double.infinity,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Column(
                          children: [
                            CircleAvatar(
                              child: Image.asset(
                                "assets/busNet2.png",
                                fit: BoxFit.cover,
                              ),
                              radius: 36,
                            ),
                            SizedBox(height: height * 0.016),
                            Text("Wilhe-lm Hartmann",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600)),
                            SizedBox(height: height * 0.0068),
                            Text("President",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff4C4C4C))),
                          ],
                        ),
                      ),
                      Container(
                        height: height * 0.252,
                        decoration: BoxDecoration(border: Border.all()),
                        padding: EdgeInsets.only(left: width * 0.03),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customRow(
                                width, "Deutscher Handballbund", "dhb.png"),
                            customRow(width, "Arnsberg, North Rhine-Westphalia",
                                "navigation.png"),
                            customRow(width, "wilhart@dhb.com", "email.png"),
                            SizedBox(height: height * 0.005),
                            Row(
                              children: [
                                Container(
                                  width: width * 0.17,
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  child: Stack(
                                    //alignment: Alignment.topRight,
                                    children: [
                                      Image.asset(
                                        'assets/avatar.png',
                                        height: 30,
                                        width: 30,
                                      ),
                                      Positioned(
                                        left: 15,
                                        child: Image.asset(
                                          'assets/avatar.png',
                                          height: 30,
                                          width: 30,
                                        ),
                                      ),
                                      Positioned(
                                        left: 30,
                                        child: Image.asset(
                                          'assets/avatar.png',
                                          height: 30,
                                          width: 30,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: width * 0.020),
                                Text("345+ connections",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14)),
                                SizedBox(width: width * 0.05),
                                Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: StadiumBorder(),
                                          elevation: 0,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width * 0.063),
                                          primary: Color(0xff002B7A)),
                                      onPressed: () {},
                                      child: Text("Connect",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold))),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //divider
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                    child: Divider(color: Color(0xffCFCFCF), thickness: 1)),
                //divider(ends)
                //People who work in this company
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.070),
                  child: Text("People who work in this company",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14)),
                ),
                SizedBox(height: height * 0.009),
                Container(
                  height: height * 0.18,
                  decoration: BoxDecoration(border: Border.all()),
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  margin: EdgeInsets.only(top: height * 0.012),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: members("Wilhe-lma", "President", width,
                              context, height, "busNet2")),
                      Expanded(
                          child: members("Petra Merkel", "Auditing Clerk",
                              width, context, height, "busNet2")),
                      Expanded(
                          child: members("Andreas Scheuer", "UX/UI Designer",
                              width, context, height, "busNet2")),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.006),
                //People who work in this company (ends)
                // view more elavted button
                Container(
                  alignment: Alignment.center,
                  height: height * 0.06,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.06),
                          shape: StadiumBorder(),
                          elevation: 0),
                      onPressed: () {},
                      child: Text("View More")),
                ),
                // view more elavted button (ends)
                SizedBox(height: height * 0.005),
                //divider (start)
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                    child: Divider(color: Color(0xffCFCFCF), thickness: 1)),
                //divider (ends)
                //Similar with business partners
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.070),
                  child: Text("Similar with business partners",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14)),
                ),
                SizedBox(height: height * 0.009),
                Container(
                  // height: height * 0.3,
                  decoration: BoxDecoration(border: Border.all()),
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  margin: EdgeInsets.only(top: height * 0.012),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: members("Wilhe-lma", "President", width,
                              context, height, "busNet3")),
                      Expanded(
                          child: members("Petra Merkel", "Auditing Clerk",
                              width, context, height, "busNet3")),
                      Expanded(
                          child: members("Andreas Scheuer", "UX/UI Designer",
                              width, context, height, "busNet3")),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.006),
              ],
            ),
          ),
        ),
      );
    });
  }
}

Widget customRow(double width, String text1, String text2) {
  return Container(
    width: double.infinity,
    child: Row(
      children: [
        Container(width: width * 0.1, child: Image.asset("assets/$text2")),
        SizedBox(width: width * 0.020),
        Text(
          text1,
          style: TextStyle(
              color: Color(0xff363636),
              fontWeight: FontWeight.w600,
              fontSize: 15),
        ),
      ],
    ),
  );
}

Widget members(String text1, String text2, double width, BuildContext context,
    double height, String image) {
  return Container(
    decoration: BoxDecoration(border: Border.all()),
    child: Column(
      children: [
        CircleAvatar(
          child: Image.asset(
            "assets/$image.png",
            fit: BoxFit.cover,
          ),
          radius: 35,
        ),
        SizedBox(height: height * 0.01),
        Container(
          child: Text(text1,
              overflow: TextOverflow.fade,
              style: TextStyle(
                color: Color(0xff363636),
                fontWeight: FontWeight.w600,
              ),
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
  );
}
