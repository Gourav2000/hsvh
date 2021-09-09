import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsvh/controllers/Prediction/PredictionPageController.dart';

class ResultPredictionPage extends StatefulWidget {
  const ResultPredictionPage({Key? key}) : super(key: key);

  @override
  _ResultPredictionPageState createState() => _ResultPredictionPageState();
}

class _ResultPredictionPageState extends State<ResultPredictionPage> {
  final PredictionPageController controller = Get.put(PredictionPageController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GetBuilder<PredictionPageController>(
        builder: (controller){
          return SafeArea(
              child: Scaffold(
                body: Container(
                  width: width,
                  height: height,
                  color: Colors.grey.shade50,
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
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(12.0)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8.0),
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
                                                fontWeight: FontWeight.bold
                                            ),
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
                          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/icons/Group 9967.png',
                                    // height: 50,
                                    // width: 50,
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Image.asset(
                                    'assets/icons/1200px-Real_Madrid_CF.svg.png',
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "WINNER",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 22.0,
                                      //fontWeight: FontWeight.bold,
                                    ),
                                  )
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
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "FINISHED",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "38 : 26",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 27.0,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
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
                        Container(
                          width: width,
                          height: 50,
                          color: Color(0xFF002B7A),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Total Points Earned",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image.asset(
                                  'assets/icons/Icon premium-quality.png',
                                width: 40.0,
                                height: 40.0,
                              ),
                              Text(
                                "20",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "See Results",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFF002B7A),
                            borderRadius: BorderRadius.circular(15.0)
                          ),
                          child: Center(
                            child: Text(
                              'Scores',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 2,
                                  // indent: width * 0.1,
                                  // endIndent: width * 0.65,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                child: Text(
                                    "5 Points",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.0
                                    )
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 2,
                                  // indent: width * 0.65,
                                  // endIndent: width * 0.1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: width * 0.95,
                              //height: 200,
                              decoration: BoxDecoration(
                                color: Color(0xFFFF0000).withOpacity(0.4),
                                borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Final Score",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23
                                      ),
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
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(12.0)
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "28",
                                                  style: TextStyle(
                                                    fontSize: 20.0
                                                  ),
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
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Row(
                                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(12.0)
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "25",
                                                  style: TextStyle(
                                                      fontSize: 20.0
                                                  ),
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
                            Image.asset(
                              'assets/icons/Group 9866.png',
                              fit: BoxFit.fill,
                              height: 35,
                              width: 35,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 2,
                                  // indent: width * 0.1,
                                  // endIndent: width * 0.65,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                child: Text(
                                    "10 Points",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.0
                                    )
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 2,
                                  // indent: width * 0.65,
                                  // endIndent: width * 0.1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: width * 0.95,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color(0xFF83FF48)
                                  ),
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Who will be the first team to score?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23
                                      ),
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
                                                color: Color(0xFFB5F298),
                                                borderRadius: BorderRadius.circular(12.0)
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade100,
                                                  borderRadius: BorderRadius.circular(12.0)
                                              ),
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
                            Image.asset(
                              'assets/icons/Tick.png',
                              fit: BoxFit.fill,
                              height: 35,
                              width: 35,
                            )
                          ],
                        ),


                        SizedBox(
                          height: 10,
                        ),
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: width * 0.95,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF0000).withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Which team will get ahead in Halftime?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23
                                      ),
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
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(12.0)
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFB5F298),
                                                  borderRadius: BorderRadius.circular(12.0)
                                              ),
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
                            Image.asset(
                              'assets/icons/Group 9866.png',
                              fit: BoxFit.fill,
                              height: 35,
                              width: 35,
                            )
                          ],
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: width * 0.95,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Color(0xFF83FF48)
                                  ),
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Which team will commit first Penalty?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23
                                      ),
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
                                                  color: Color(0xFFB5F298),
                                                  borderRadius: BorderRadius.circular(12.0)
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade100,
                                                  borderRadius: BorderRadius.circular(12.0)
                                              ),
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
                            Image.asset(
                              'assets/icons/Tick.png',
                              fit: BoxFit.fill,
                              height: 35,
                              width: 35,
                            )
                          ],
                        ),


                        SizedBox(
                          height: 10,
                        ),
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: width * 0.95,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF0000).withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "How many total penalties will be called?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23
                                      ),
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
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(8.0)
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
                            Image.asset(
                              'assets/icons/Group 9866.png',
                              fit: BoxFit.fill,
                              height: 35,
                              width: 35,
                            )
                          ],
                        ),


                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 2,
                                  // indent: width * 0.1,
                                  // endIndent: width * 0.65,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                child: Text(
                                    "5 Points",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.0
                                    )
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 2,
                                  // indent: width * 0.65,
                                  // endIndent: width * 0.1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: width * 0.95,
                              //height: 200,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF0000).withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Final Score",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23
                                      ),
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
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(12.0)
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "28",
                                                  style: TextStyle(
                                                      fontSize: 20.0
                                                  ),
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
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Row(
                                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(12.0)
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "25",
                                                  style: TextStyle(
                                                      fontSize: 20.0
                                                  ),
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
                            Image.asset(
                              'assets/icons/Group 9866.png',
                              fit: BoxFit.fill,
                              height: 35,
                              width: 35,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 2,
                                  // indent: width * 0.1,
                                  // endIndent: width * 0.65,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                child: Text(
                                    "10 Points",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.0
                                    )
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 2,
                                  // indent: width * 0.65,
                                  // endIndent: width * 0.1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: width * 0.95,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Color(0xFF83FF48)
                                  ),
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Who will be the first team to score?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23
                                      ),
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
                                                  color: Color(0xFFB5F298),
                                                  borderRadius: BorderRadius.circular(12.0)
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade100,
                                                  borderRadius: BorderRadius.circular(12.0)
                                              ),
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
                            Image.asset(
                              'assets/icons/Tick.png',
                              fit: BoxFit.fill,
                              height: 35,
                              width: 35,
                            )
                          ],
                        ),


                        SizedBox(
                          height: 10,
                        ),
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: width * 0.95,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF0000).withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Which team will get ahead in Halftime?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23
                                      ),
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
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(12.0)
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFB5F298),
                                                  borderRadius: BorderRadius.circular(12.0)
                                              ),
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
                            Image.asset(
                              'assets/icons/Group 9866.png',
                              fit: BoxFit.fill,
                              height: 35,
                              width: 35,
                            )
                          ],
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: width * 0.95,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Color(0xFF83FF48)
                                  ),
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Which team will commit first Penalty?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23
                                      ),
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
                                                  color: Color(0xFFB5F298),
                                                  borderRadius: BorderRadius.circular(12.0)
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade100,
                                                  borderRadius: BorderRadius.circular(12.0)
                                              ),
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
                            Image.asset(
                              'assets/icons/Tick.png',
                              fit: BoxFit.fill,
                              height: 35,
                              width: 35,
                            )
                          ],
                        ),


                        SizedBox(
                          height: 10,
                        ),
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              width: width * 0.95,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF0000).withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "How many total penalties will be called?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23
                                      ),
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
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(8.0)
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
                            Image.asset(
                              'assets/icons/Group 9866.png',
                              fit: BoxFit.fill,
                              height: 35,
                              width: 35,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              )
          );
        }
    );
  }
}
