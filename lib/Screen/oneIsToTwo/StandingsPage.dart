import 'package:flutter/material.dart';
import 'package:hsvh/BasicWidgets.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hsvh/controllers/Feed/StandingPageController.dart';
import 'package:get/get.dart';

class StandingsPage extends StatefulWidget {
  @override
  _TeamStandingsState createState() => _TeamStandingsState();
}

class _TeamStandingsState extends State<StandingsPage> {
  final StandingPageController controller2 = Get.put(StandingPageController());

  @override
  void initState() {
    super.initState();
    // controller2.updateLoading(true);
    // controller2.fecthStanding().then((value) {
    //   controller2.updateLoading(false);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StandingPageController>(
      builder: (controller) {
        return Scaffold(
          body: StreamBuilder(
            stream: controller.fecthStanding(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                Center(child: CircularProgressIndicator());
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 26),
                    // appBar
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(color: Color(0xffFFFFFF)),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 18,
                              )),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.14),
                        Text(
                          "Team Standings",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            // color: Color(0xff222222),
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    SizedBox(height: 10),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: MediaQuery.of(context).size.height * 0.88,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // border: Border.all(),
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("LIQUI MOLY\nHandball-Bundesliga",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.020),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              width: double.infinity,
                              height: 30,
                              decoration:
                                  BoxDecoration(color: Colors.grey.shade100),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text("CLUB",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12)),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Text("SP",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Text("+/-",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 32),
                                    child: Text("PTS",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12)),
                                  ),
                                ],
                              ),
                            ),

                            // long list
                            controller.isLoading.value == true
                                ? Column(
                                    children: [
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.27),
                                      progressIndicator(),
                                    ],
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.only(
                                            right: 10, left: 10),
                                        margin:
                                            EdgeInsets.only(right: 8, left: 8),
                                        height: 45,
                                        decoration: BoxDecoration(
                                            color: index == 0
                                                ? Color(0xff002B7A)
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.07,
                                                  // padding: EdgeInsets.only(left: 2),
                                                  child: Text(
                                                      (index + 1).toString(),
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: index == 0
                                                              ? Colors.white
                                                              : Colors.black)),
                                                ),
                                                Image.asset(
                                                    "assets/teamtsanding.png"),
                                                // SizedBox(width: 10),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.02,
                                                  child: Text(
                                                      controller
                                                          .standingItems[index]
                                                          .name
                                                          .toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: index == 0
                                                              ? Colors.white
                                                              : Colors.black)),
                                                ),
                                              ],
                                            ),
                                            SizedBox(width: 14),
                                            Row(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.05,
                                                  child: Text(
                                                      controller
                                                          .standingItems[index]
                                                          .sp
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: index == 0
                                                              ? Colors.white
                                                              : Colors.black)),
                                                ),
                                                SizedBox(width: 5),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.05,
                                                  child: Text(
                                                      controller
                                                          .standingItems[index]
                                                          .wins
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: index == 0
                                                              ? Colors.white
                                                              : Colors.black)),
                                                ),
                                                SizedBox(width: 5),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.05,
                                                  child: Text(
                                                      controller
                                                          .standingItems[index]
                                                          .lose
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: index == 0
                                                              ? Colors.white
                                                              : Colors.black)),
                                                ),
                                                SizedBox(width: 5),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.05,
                                                  child: Text(
                                                      controller
                                                          .standingItems[index]
                                                          .pts
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: index == 0
                                                              ? Colors.white
                                                              : Colors.black)),
                                                ),
                                                // SizedBox(width: 10),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    itemCount: controller.standingItems.length,
                                  )
                          ],
                        ),
                      ),
                    ),
                    // Container(
                    //   height: MediaQuery.of(context).size.height * 0.86,
                    //   margin: EdgeInsets.all(12),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(),
                    //   ),
                    //   child: ListView.builder(
                    //     itemBuilder: (context, index) {
                    //       return Container();
                    //     },
                    //     itemCount: 100,
                    //   ),
                    // )
                  ],
                ),
              );
            },
          ),
          backgroundColor: Colors.grey.shade100,
          floatingActionButton: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 43,
              child: FloatingActionButton.extended(
                onPressed: () {},
                backgroundColor: Color(0xff002B7A),
                label: Text(
                  "See Detailed Rankings",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
              )),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}
