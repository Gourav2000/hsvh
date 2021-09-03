import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:hsvh/controllers/Feed/TeamsPageController.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TeamPlayersDetailScreen extends StatefulWidget {
  final String? id;
  TeamPlayersDetailScreen({this.id});

  @override
  _TeamPlayersDetailScreenState createState() =>
      _TeamPlayersDetailScreenState();
}

class _TeamPlayersDetailScreenState extends State<TeamPlayersDetailScreen> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  final TeamsPageController controller2 = Get.put(TeamsPageController());

  late Team selectPlayer;
  @override
  void initState() {
    super.initState();

    Team txselectPlayer = controller2.selectPlayer(widget.id!);
    selectPlayer = txselectPlayer;
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar(context),

      ////// 1 st part(NAME AND RANK)
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 30),
              height: MediaQuery.of(context).size.height * 0.44,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1st phase
                  Container(
                    width: double.infinity,
                    child: Text(
                        "${selectPlayer.playerFirstName}\n${selectPlayer.playerLastName}",
                        style: TextStyle(
                          color: Color(0xff1E2022),
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2),
                  ),

                  Container(
                    width: width * 0.9,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: width * 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: height * 0.010),
                              Padding(
                                padding: EdgeInsets.only(left: width * 0.05),
                                child: Row(
                                  children: [
                                    Text(
                                      "#",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Text(
                                      "${selectPlayer.playerNumber}",
                                      style: TextStyle(
                                          fontSize: 35,
                                          color: Color(0xff1E2022),
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      width: width * 0.020,
                                    ),
                                    Image.asset(
                                      "assets/hamburg.png",
                                      height: 46,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: height * 0.015),
                              //position hand and age
                              SizedBox(height: height * 0.016),
                              positionHandAge(context, "Position",
                                  selectPlayer.playerPosition.toString()),
                              SizedBox(height: height * 0.01),
                              positionHandAge(context, "Hand",
                                  selectPlayer.playerPosition.toString()),
                              SizedBox(height: height * 0.01),
                              positionHandAge(
                                  context, "Age", selectPlayer.age.toString()),
                              SizedBox(height: height * 0.01),
                            ],
                          ),
                        ),
                        //image
                        Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.33,
                              padding: EdgeInsets.only(top: height * 0.040),
                              child: Image.asset(
                                'assets/teamsimage.png',
                                width: width * 0.39,
                                fit: BoxFit.cover,
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                alignment: Alignment.bottomCenter,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: height * 0.1,
                                alignment: Alignment.bottomLeft,
                                padding: EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 6),
                                width: width * 0.4225,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xf004170),
                                        Color(0xff004170),
                                      ],
                                      stops: [
                                        0,
                                        1
                                      ]),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  // Container(
                  //   // width: (MediaQuery.of(context).size.width) * 0.42,
                  //   height: MediaQuery.of(context).size.height * 0.32,

                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.only(
                  //         topLeft: Radius.circular(15),
                  //         topRight: Radius.circular(15)),
                  //     child: Image.asset(
                  //       "assets/detailplayer.png",
                  //       fit: BoxFit.cover,
                  //       width: 170,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            //    2 nd part(POSITION HAND AND AGE)
            // Stack(
            //         children: [
            //           Container(
            //             width: 250,
            //             decoration: BoxDecoration(border: Border.all()),
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.start,
            //               crossAxisAlignment: CrossAxisAlignment.center,
            //               children: [
            //                 Text(
            //                     "${selectPlayer.playerFirstName}\n${selectPlayer.playerLastName}",
            //                     style: TextStyle(
            //                       color: Color(0xff1E2022),
            //                       fontSize: 34,
            //                       fontWeight: FontWeight.w600,
            //                     ),
            //                     maxLines: 2),
            //                 SizedBox(height: 4),
            //                 Row(
            //                   children: [
            //                     Text(
            //                       "#${selectPlayer.playerNumber}",
            //                       style: TextStyle(
            //                           color: Color(0xff1E2022),
            //                           fontSize: 40,
            //                           fontWeight: FontWeight.w700),
            //                     ),
            //                     SizedBox(width: 5),
            //                     Image.asset(
            //                       "assets/detailteamlogo.png",
            //                       fit: BoxFit.cover,
            //                       width: 30,
            //                       height: 37,
            //                     )
            //                   ],
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),

            // SizedBox(height: 10),

            /*




















            */
            //    3 rd part(GOALS MATHS HEIGH AND WEIGHT)

            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  // 1 st row
                  customRow1(context, selectPlayer.goals.toString(), "4",
                      selectPlayer.matches.toString()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Divider(thickness: 1),
                  ),
                  customRow2(context, "248", selectPlayer.weight.toString(),
                      selectPlayer.height.toString()),
                ],
              ),
            ),
            SizedBox(height: 10),
            // chart

            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(height: 8),
                  Text("All Apperance",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff1E2022))),
                  SizedBox(height: 8),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.46,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(),
                    child: SfCircularChart(
                      tooltipBehavior: _tooltipBehavior,
                      // legend: Legend(
                      //     isVisible: true,
                      //     overflowMode: LegendItemOverflowMode.scroll),
                      series: <CircularSeries>[
                        DoughnutSeries<GDPData, String>(
                            dataSource: _chartData,
                            xValueMapper: (GDPData data, _) => data.continent,
                            yValueMapper: (GDPData data, _) => data.gdp,
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true),
                            enableTooltip: true,
                            cornerStyle: CornerStyle.bothFlat),
                      ],
                      borderWidth: 1,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade200,
    );
  }
}

//*
// widgets
PreferredSizeWidget appBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.grey.shade50,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios),
      color: Colors.black,
      onPressed: () => Navigator.of(context).pop(),
    ),
    title: Row(
      children: [
        Spacer(
          flex: 3,
        ),
        Text(
          'PLAYER PROFILE',
          style: TextStyle(
              color: Color(0xff222222),
              fontSize: 18,
              fontWeight: FontWeight.w300,
              letterSpacing: 1),
        ),
        Spacer(
          flex: 4,
        )
      ],
    ),
  );
}

//postion hand and age
Widget positionHandAge(BuildContext context, String text1, String text2) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.93,
    height: MediaQuery.of(context).size.height * 0.07,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: 187,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                color: Color(0xffC41C27)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(text1, style: TextStyle(color: Color(0xffFFFFFF))),
                // Text("Hand",
                //     style: TextStyle(color: Color(0xffFFFFFF))),
                // Text("Age",
                //     style: TextStyle(color: Color(0xffFFFFFF))),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: 187,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(7),
                ),
                color: Color(0xff004170)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("$text2", style: TextStyle(color: Color(0xffFFFFFF))),
                // Text("Right",
                //     style: TextStyle(color: Color(0xffFFFFFF))),
                // Text("${selectPlayer.age}",
                //     style: TextStyle(color: Color(0xffFFFFFF))),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

// custom row

Widget customRow1(BuildContext context, text1, text2, text3) {
  return Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Column(
            children: [
              SizedBox(height: 6),
              Image.asset(
                "assets/footballl.png",
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SizedBox(height: 4),
              Text(
                "GOALS",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff818181)),
              ),
              Text(
                text1,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              SizedBox(height: 6),
              Image.asset(
                "assets/assist.png",
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SizedBox(height: 4),
              Text(
                "ASSIST",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff818181)),
              ),
              Text(
                text2,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              SizedBox(height: 6),
              Image.asset(
                "assets/goals.png",
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SizedBox(height: 4),
              Text(
                "MATCHES",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff818181)),
              ),
              Text(
                text3,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              )
            ],
          ),
        )
      ],
    ),
  );
}

// custom row 2
Widget customRow2(BuildContext context, text3, text4, text5) {
  return Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Column(
            children: [
              SizedBox(height: 2),
              Image.asset(
                "assets/footballl.png",
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SizedBox(height: 4),
              Text(
                "GOALS",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff818181)),
              ),
              Text(
                "text3",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              SizedBox(height: 6),
              Image.asset(
                "assets/weight.png",
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SizedBox(height: 4),
              Text(
                "WEIGHT",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff818181)),
              ),
              Text(
                "$text4 kg",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              SizedBox(height: 6),
              Image.asset(
                "assets/height.png",
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SizedBox(height: 4),
              Text(
                "HEIGHT",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff818181)),
              ),
              Text(
                "$text5 cm",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              )
            ],
          ),
        )
      ],
    ),
  );
}

List<GDPData> getChartData() {
  final List<GDPData> chartData = [
    GDPData('Oceania', 1600),
    GDPData('Africa', 2490),
    GDPData('S America', 2900),
  ];
  return chartData;
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
