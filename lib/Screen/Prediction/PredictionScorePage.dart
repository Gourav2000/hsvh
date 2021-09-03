import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsvh/controllers/Prediction/PredictionPageController.dart';

class PredictionScorePage extends StatefulWidget {
  const PredictionScorePage({Key? key}) : super(key: key);

  @override
  _PredictionScorePageState createState() => _PredictionScorePageState();
}

class _PredictionScorePageState extends State<PredictionScorePage> {
  final PredictionPageController controller =
      Get.put(PredictionPageController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GetBuilder<PredictionPageController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
        body: Container(
          width: width,
          height: height,
          //color: Colors.white,
          color: Color(0xFFE5E5E5).withOpacity(0.1),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        iconSize: 25,
                        color: Colors.black,
                        onPressed: () {},
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(12.0)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, right: 8.0, bottom: 8.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/Group crown.png',
                                    width: 30,
                                    height: 20,
                                  ),
                                  Text(
                                    "2400",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 0,
                          ),
                          Image.asset(
                            'assets/icons/Group 1.png',
                            height: 50,
                            width: 50,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/icons/1200px-Real_Madrid_CF.svg.png',
                            height: 50,
                            width: 50,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Text(
                                "Status",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "2H30mins left",
                              style: TextStyle(
                                  color: Color(0xFF26A159),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'assets/icons/image 9.png',
                            height: 50,
                            width: 50,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Predict Before Kick Off",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  width: 120,
                  //height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xFF002B7A),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Center(
                    child: Text(
                      'Scores',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  //alignment: Alignment.topRight,
                  children: [
                    Container(
                      width: width * 0.95,
                      //height: 200,
                      decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          //color: Color(0xFFE4EAF0),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              "Final Score",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 23),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Füchse Berlin",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.0,
                                        //fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 40,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFB5F298),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      child: Center(
                                        child: Text(
                                          "28",
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  ":",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFFB9595),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      child: Center(
                                        child: Text(
                                          "25",
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Weilstetten",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.0,
                                        //fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: InkWell(
                        onTap: () {
                          scoreDialog(width, height);
                        },
                        child: Image.asset(
                          'assets/icons/Icon edit.png',
                          fit: BoxFit.fill,
                          height: 35,
                          width: 35,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Image.asset(
                        'assets/icons/Group 308.png',
                        fit: BoxFit.fill,
                        height: 40,
                        width: 50,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  //alignment: Alignment.topRight,
                  children: [
                    Container(
                      width: width * 0.95,
                      decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          //color: Color(0xFFFF0000).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
                            Text(
                              "How many total penalties will be called?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 50,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            "10",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17.0,
                                              //fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFE4EAF0),
                                          borderRadius:
                                              BorderRadius.circular(8.0)),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: InkWell(
                        onTap: (){
                          penaltyDialog(width, height);
                        },
                        child: Image.asset(
                          'assets/icons/Icon edit.png',
                          fit: BoxFit.fill,
                          height: 35,
                          width: 35,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Image.asset(
                        'assets/icons/Group 308.png',
                        fit: BoxFit.fill,
                        // height: 40,
                        // width: 50,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      width: width * 0.95,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // border: Border.all(
                          //     color: Color(0xFF83FF48)
                          // ),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
                            Text(
                              "Who will be the first team to score?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 50,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            "Füchse Berlin",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17.0,
                                              //fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFE4EAF0),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFE4EAF0),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            "Weilstetten",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17.0,
                                              //fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: InkWell(
                        onTap: (){
                          //teamSelectDialog(width, height);
                        },
                        child: Image.asset(
                          'assets/icons/Icon edit.png',
                          fit: BoxFit.fill,
                          height: 35,
                          width: 35,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Image.asset(
                        'assets/icons/Group 307.png',
                        fit: BoxFit.fill,
                        height: 40,
                        width: 50,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      width: width * 0.95,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
                            Text(
                              "Which team will get ahead in Halftime?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 50,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            "Füchse Berlin",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17.0,
                                              //fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFE4EAF0),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFE4EAF0),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            "Weilstetten",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17.0,
                                              //fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: InkWell(
                        onTap: (){
                          teamSelectDialog(width, height);
                        },
                        child: Image.asset(
                          'assets/icons/Icon edit.png',
                          fit: BoxFit.fill,
                          height: 35,
                          width: 35,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Image.asset(
                        'assets/icons/Group 307.png',
                        fit: BoxFit.fill,
                        height: 40,
                        width: 50,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      width: width * 0.95,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // border: Border.all(
                          //     color: Color(0xFF83FF48)
                          // ),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            children: [
                              Text(
                                "Which team will commit first Penalty?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 50,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              "Füchse Berlin",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17.0,
                                                //fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: Color(0xFFE4EAF0),
                                            borderRadius:
                                                BorderRadius.circular(12.0)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFE4EAF0),
                                            borderRadius:
                                                BorderRadius.circular(12.0)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              "Weilstetten",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17.0,
                                                //fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Image.asset(
                        'assets/icons/Icon edit.png',
                        fit: BoxFit.fill,
                        height: 35,
                        width: 35,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Image.asset(
                        'assets/icons/Group 9939.png',
                        fit: BoxFit.fill,
                        height: 40,
                        width: 50,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  width: 120,
                  //height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xFF002B7A),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Center(
                    child: Text(
                      'Events',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Difficulty: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                    Text(
                      "Easy",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF409200),
                          fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  //alignment: Alignment.topRight,
                  children: [
                    Container(
                      width: width * 0.95,
                      //height: 200,
                      decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          //color: Color(0xFFE4EAF0),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
                            Text(
                              "Who will win the opening coin toss?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 50,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            "Füchse Berlin",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17.0,
                                              //fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFE4EAF0),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFE4EAF0),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            "Weilstetten",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17.0,
                                              //fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Image.asset(
                        'assets/icons/Icon edit.png',
                        fit: BoxFit.fill,
                        height: 35,
                        width: 35,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Image.asset(
                        'assets/icons/Group 308.png',
                        fit: BoxFit.fill,
                        height: 40,
                        width: 50,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Difficulty: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                    Text(
                      "Medium",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF8B200),
                          fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      width: width * 0.95,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // border: Border.all(
                          //     color: Color(0xFF83FF48)
                          // ),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
                            Text(
                              "Who will get first Yellow card?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 50,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            "Select Team",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17.0,
                                              //fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFE4EAF0),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFE4EAF0),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            "Select Team",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17.0,
                                              //fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: InkWell(
                        onTap: (){
                          selectTeamPlayerDialog(width, height);
                        },
                        child: Image.asset(
                          'assets/icons/Icon edit.png',
                          fit: BoxFit.fill,
                          height: 35,
                          width: 35,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Image.asset(
                        'assets/icons/Group 307.png',
                        fit: BoxFit.fill,
                        height: 40,
                        width: 50,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      width: width * 0.95,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // border: Border.all(
                          //     color: Color(0xFF83FF48)
                          // ),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
                            Text(
                              "Who gets the first Red Card?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 50,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Center(
                                          child: Text(
                                            "Select Team",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17.0,
                                              //fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFE4EAF0),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFE4EAF0),
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Center(
                                          child: Text(
                                            "Select Team",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17.0,
                                              //fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Image.asset(
                        'assets/icons/Icon edit.png',
                        fit: BoxFit.fill,
                        height: 35,
                        width: 35,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Image.asset(
                        'assets/icons/Group 307.png',
                        fit: BoxFit.fill,
                        height: 40,
                        width: 50,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Difficulty: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                    Text(
                      "Hard",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF0000),
                          fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      width: width * 0.95,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // border: Border.all(
                          //     color: Color(0xFF83FF48)
                          // ),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            children: [
                              Text(
                                "Who Scores the most Goals in the game?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 50,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Center(
                                            child: Text(
                                              "Select Team",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17.0,
                                                //fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: Color(0xFFE4EAF0),
                                            borderRadius:
                                                BorderRadius.circular(12.0)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFE4EAF0),
                                            borderRadius:
                                                BorderRadius.circular(12.0)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Center(
                                            child: Text(
                                              "Select Team",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17.0,
                                                //fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Image.asset(
                        'assets/icons/Icon edit.png',
                        fit: BoxFit.fill,
                        height: 35,
                        width: 35,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Image.asset(
                        'assets/icons/Group 9939.png',
                        fit: BoxFit.fill,
                        height: 40,
                        width: 50,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){
                    submitDialog(width, height);
                  },
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    width: width * 0.85,
                    decoration: BoxDecoration(
                        color: Color(0xFF002B7A),
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Center(
                      child: Text(
                        "SUBMIT",
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ));
    });
  }

  scoreDialog(double width, double height) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.only(left: 0, right: 0),
            //title: Center(child: Text("Final Score")),
            content: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  padding: EdgeInsets.all(10.0),
                  width: width,
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Final Score",
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Füchse Berlin",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(onPressed: () {}, icon: Icon(Icons.add_circle, color: Colors.grey,)),
                                Container(
                                  width: 40,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFB5F298),
                                      borderRadius: BorderRadius.circular(0)),
                                  child: Center(
                                    child: Text(
                                      "28",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Image.asset(
                                  'assets/icons/Icon Subtract.png',
                                  fit: BoxFit.fill,
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Row(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(onPressed: () {}, icon: Icon(Icons.add_circle, color: Colors.grey,)),
                                Container(
                                  width: 40,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFB9595),
                                      borderRadius: BorderRadius.circular(0)),
                                  child: Center(
                                    child: Text(
                                      "25",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Image.asset(
                                  'assets/icons/Icon Subtract.png',
                                  fit: BoxFit.fill,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              child: Text(
                                "Weilstetten",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  //fontWeight: FontWeight.bold
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Image.asset(
                    'assets/icons/Tick.png',
                    fit: BoxFit.fill,
                    // height: 40,
                    // width: 50,
                  ),
                ),
              ],
            ),
          );
        });
  }

  penaltyDialog(double width, double height) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.only(left: 0, right: 0),
            //title: Center(child: Text("Final Score")),
            content: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                    padding: EdgeInsets.all(10.0),
                    width: width,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "How many total Penalties will be called?",
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/Icon Subtract.png',
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 40,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Color(0xFFE4EAF0),
                                  borderRadius: BorderRadius.circular(0)),
                              child: Center(
                                child: Text(
                                  "10",
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ),
                            IconButton(onPressed: () {}, icon: Icon(Icons.add_circle, color: Colors.grey,)),
                          ],
                        ),
                      ],
                    )),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Image.asset(
                    'assets/icons/Tick.png',
                    fit: BoxFit.fill,
                    // height: 40,
                    // width: 50,
                  ),
                ),
              ],
            ),
          );
        });
  }

  teamSelectDialog(double width, double height) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.only(left: 0, right: 0),
            //title: Center(child: Text("Final Score")),
            content: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                    padding: EdgeInsets.all(10.0),
                    width: width,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Which team will get ahead in Halftime?",
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        "Füchse Berlin",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17.0,
                                          //fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFB5F298),
                                      borderRadius:
                                      BorderRadius.circular(12.0)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE4EAF0),
                                      borderRadius:
                                      BorderRadius.circular(12.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        "Weilstetten",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17.0,
                                          //fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    )),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Image.asset(
                    'assets/icons/Tick.png',
                    fit: BoxFit.fill,
                    // height: 40,
                    // width: 50,
                  ),
                ),
              ],
            ),
          );
        });
  }

  selectTeamPlayerDialog(double width, double height) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.only(left: 0, right: 0),
            //title: Center(child: Text("Final Score")),
            content: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                    padding: EdgeInsets.all(10.0),
                    width: width,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Who will get first Yellow card?",
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Select Team",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17.0,
                                            //fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(Icons.arrow_drop_down_outlined,color: Color(0xFF1E2022),)
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE4EAF0),
                                      borderRadius:
                                      BorderRadius.circular(12.0)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE4EAF0),
                                      borderRadius:
                                      BorderRadius.circular(12.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Select Player",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17.0,
                                            //fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(Icons.arrow_drop_down_outlined, color: Color(0xFF1E2022),)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    )),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Image.asset(
                    'assets/icons/Tick.png',
                    fit: BoxFit.fill,
                    // height: 40,
                    // width: 50,
                  ),
                ),
              ],
            ),
          );
        });
  }

  submitDialog(double width, double height) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.only(left: 0, right: 0),
            content: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0)
                ),
                padding: EdgeInsets.all(10.0),
                width: width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.all(12.0),
                          width: width * 0.35,
                          decoration: BoxDecoration(
                              //color: Color(0xFF002B7A),
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Center(
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12.0),
                          width: width * 0.35,
                          decoration: BoxDecoration(
                              color: Color(0xFF002B7A),
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Center(
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                )),
          );
        });
  }

}
