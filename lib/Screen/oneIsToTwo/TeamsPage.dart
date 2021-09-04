import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsvh/BasicWidgets.dart';
import 'package:hsvh/Screen/oneIsToTwo/teamPlayersDetailScreen.dart';
import 'package:hsvh/controllers/Feed/TeamsPageController.dart';

class TeamsPage extends StatefulWidget {
  const TeamsPage({Key? key}) : super(key: key);

  @override
  _TeamsPageState createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  final TeamsPageController controller2 = Get.put(TeamsPageController());

  @override
  void initState() {
    super.initState();
    controller2.updateLoading(true);
    controller2.fecthTeam("Pivot").then((value) {
      controller2.updateLoading(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<TeamsPageController>(builder: (controller) {
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
                  flex: 3,
                ),
                Text(
                  'TEAMS',
                  style: TextStyle(color: Colors.grey.shade800),
                ),
                Spacer(
                  flex: 4,
                )
              ],
            ),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey.shade800,
                  ),
                  onPressed: () {}),
            ],
          ),
          body: Container(
            height: height,
            width: width,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.015,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: InkWell(
                              onTap: () async {
                                controller.updateSelectedFeild(0);
                                controller.updateLoading(true);
                                await controller.fecthTeam("Pivot");
                                controller.updateLoading(false);
                              },
                              child: playerType(controller, "Pivot", 0)),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: InkWell(
                              onTap: () async {
                                controller.updateSelectedFeild(1);
                                controller.updateLoading(true);
                                await controller.fecthTeam("Goalkeeper");
                                controller.updateLoading(false);
                              },
                              child: playerType(controller, "Goal Keeper", 1)),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: InkWell(
                              onTap: () async {
                                controller.updateSelectedFeild(2);
                                controller.updateLoading(true);
                                await controller.fecthTeam("Right Back");
                                controller.updateLoading(false);
                              },
                              child: playerType(controller, "Right Back", 2)),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: InkWell(
                              onTap: () async {
                                controller.updateSelectedFeild(3);
                                controller.updateLoading(true);
                                await controller.fecthTeam("Left Back");
                                controller.updateLoading(false);
                              },
                              child: playerType(controller, "Left Back", 3)),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: InkWell(
                              onTap: () async {
                                controller.updateSelectedFeild(4);
                                controller.updateLoading(true);
                                await controller.fecthTeam("Right Wing");
                                controller.updateLoading(false);
                              },
                              child: playerType(controller, "Right Wing", 4)),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: InkWell(
                              onTap: () async {
                                controller.updateSelectedFeild(5);
                                controller.updateLoading(true);
                                await controller.fecthTeam("Left Wing");
                                controller.updateLoading(false);
                              },
                              child: playerType(controller, "Left Wing", 5)),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: InkWell(
                              onTap: () async {
                                controller.updateSelectedFeild(6);
                                controller.updateLoading(true);
                                await controller.fecthTeam("Centre Back");
                                controller.updateLoading(false);
                              },
                              child: playerType(controller, "Centre Back", 6)),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.05, right: width * 0.05),
                    child: controller.isLoading.value == true
                        ? progressIndicator()
                        // ontaping to a particular player
                        : GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: width * 0.5,
                                    childAspectRatio: 3 / 4,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: controller.teamMembers.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          TeamPlayersDetailScreen(
                                              id: controller
                                                  .teamMembers[index].id)));
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(0.2),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          // decoration: BoxDecoration(
                                          // border: Border.all()),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                        height: height * 0.13,
                                                        alignment: Alignment
                                                            .bottomLeft,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 6,
                                                                horizontal: 6),
                                                        width: width * 0.4,
                                                        decoration:
                                                            BoxDecoration(
                                                          // border: Border.all(),
                                                          gradient: LinearGradient(
                                                              begin: Alignment
                                                                  .topCenter,
                                                              end: Alignment
                                                                  .bottomCenter,
                                                              colors: [
                                                                Color(
                                                                    0xf004170),
                                                                Color(
                                                                    0xff004170),
                                                              ],
                                                              stops: [
                                                                0,
                                                                1
                                                              ]),
                                                        ),
                                                        child: Text(
                                                          "${controller.teamMembers[index].playerFirstName}\n${controller.teamMembers[index].playerLastName}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              color: Color(0xff004170),
                                            ),
                                            child: Text(
                                              "25",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.w700),
                                            )),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade50,
                                      // border: Border.all(),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/teamsimage.png'),
                                          fit: BoxFit.cover),
                                      // boxShadow: <BoxShadow>[
                                      //   BoxShadow(
                                      //       color: Colors.black54,
                                      //       blurRadius: 5.0,
                                      //       offset: Offset(0.0, 0.75)),
                                      // ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                  ),
                ),
              ],
            ),
          ));
    });
  }
}

Widget playerType(TeamsPageController controller, String text, int index) {
  return Container(
    decoration: BoxDecoration(
        color: controller.selectedFeild.value == index
            ? Colors.indigo
            : Colors.grey.shade50,
        borderRadius: BorderRadius.all(Radius.circular(5))),
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
            color: controller.selectedFeild.value == index
                ? Colors.white
                : Colors.indigo,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}
