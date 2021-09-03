import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsvh/controllers/Prediction/PredictionPageController.dart';

class LeadershipPage extends StatefulWidget {
  const LeadershipPage({Key? key}) : super(key: key);

  @override
  _LeadershipPageState createState() => _LeadershipPageState();
}

class _LeadershipPageState extends State<LeadershipPage> {
  final PredictionPageController controller = Get.put(PredictionPageController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GetBuilder<PredictionPageController>(
      builder: (controller){
        return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xFFE5E5E5),
                automaticallyImplyLeading: false,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  iconSize: 25,
                  color: Colors.black,
                  onPressed: () {},
                ),
                centerTitle: true,
                title: Text(
                  "Leaderboard",
                  style: TextStyle(
                    color: Colors.black
                  ),
                ),
              ),
              body: Container(
                width: width,
                height: height,
                color: Color(0xFFE5E5E5),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        'assets/User.png',
                        fit: BoxFit.fill,
                        height: 80,
                        width: 80,
                      ),
                      SizedBox(
                        height: 7.0,
                      ),
                      Text(
                        "Lottie Poole",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12.0)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        width: width * 0.70,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.white
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                  "Today",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Container(
                              width: width * 0.25,
                              height: 35,
                              //padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  // border: Border.all(
                                  //     color: Colors.black
                                  // ),
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Color(0xFF002B7A)
                              ),
                              child: Center(
                                  child: Text(
                                      "Yearly",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                              ),
                            ),
                            Container(
                              child: Text(
                                  "Month",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.0,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Stack(
                        //alignment: Alignment.center,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 5, top: 20),
                            child: Column(
                              children: [
                                Text(
                                    "2",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Image.asset(
                                  'assets/Ellipse 87.png',
                                  fit: BoxFit.fill,
                                  height: 110,
                                  width: 110,
                                ),
                                Text(
                                    "Günter",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                                Text(
                                    "8032",
                                    style: TextStyle(
                                        color: Color(0xFF00B05C),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 195, top: 30),
                            child: Column(
                              children: [
                                Text(
                                    "3",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Image.asset(
                                  'assets/Ellipse 88.png',
                                  fit: BoxFit.fill,
                                  height: 110,
                                  width: 110,
                                ),
                                Text(
                                    "Anna",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                                Text(
                                    "7884",
                                    style: TextStyle(
                                        color: Color(0xFF00B05C),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 100),
                            child: Column(
                              children: [
                                Text(
                                    "1",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Image.asset(
                                  'assets/Ellipse 86.png',
                                  fit: BoxFit.fill,
                                  height: 110,
                                  width: 110,
                                ),
                                Text(
                                    "Christina",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                                Text(
                                    "8122",
                                    style: TextStyle(
                                        color: Color(0xFF00B05C),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0)
                        ),
                        width: width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "3",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                  "Darlene Robertson",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                  "7561",
                                style: TextStyle(
                                    color: Color(0xFFC41C27),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0)
                        ),
                        width: width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "4",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "Jane Cooper",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "7423",
                                style: TextStyle(
                                    color: Color(0xFFC41C27),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0)
                        ),
                        width: width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "5",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "Guy Hawkins",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "7124",
                                style: TextStyle(
                                    color: Color(0xFFC41C27),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0)
                        ),
                        width: width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "3",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "Darlene Robertson",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "7561",
                                style: TextStyle(
                                    color: Color(0xFFC41C27),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0)
                        ),
                        width: width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "3",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "Darlene Robertson",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "7561",
                                style: TextStyle(
                                    color: Color(0xFFC41C27),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0)
                        ),
                        width: width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "3",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "Darlene Robertson",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "7561",
                                style: TextStyle(
                                    color: Color(0xFFC41C27),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0)
                        ),
                        width: width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "3",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "Darlene Robertson",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                "7561",
                                style: TextStyle(
                                    color: Color(0xFFC41C27),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
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
      },
    );
  }
}
