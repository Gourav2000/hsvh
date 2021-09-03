import 'package:flutter/material.dart';

class Schedule {
  String? titleA;
  String? titleB;
  String? groupA;
  String? groupB;
  String? iconA;
  String? iconB;
  Schedule(
      {this.groupA,
      this.groupB,
      this.iconA,
      this.iconB,
      this.titleA,
      this.titleB});
}

class SchedulePage extends StatelessWidget {
  final List<Schedule> item1 = [
    Schedule(
        groupA: "Group B",
        titleA: "Hamburg",
        titleB: "Eulen",
        groupB: "Group B",
        iconA: "assets/image1.png",
        iconB: "assets/image2.png"),
    Schedule(
        groupA: "Group B",
        titleA: "Hamburg",
        titleB: "Eulen",
        groupB: "Group B",
        iconA: "assets/image1.png",
        iconB: "assets/image2.png"),
  ];
  final List<Schedule> item2 = [
    Schedule(
        groupA: "Group B",
        titleA: "Hamburg",
        titleB: "Eulen",
        groupB: "Group B",
        iconA: "assets/image1.png",
        iconB: "assets/image2.png"),
    Schedule(
        groupA: "Group B",
        titleA: "Hamburg",
        titleB: "Eulen",
        groupB: "Group B",
        iconA: "assets/image1.png",
        iconB: "assets/image2.png"),
    Schedule(
        groupA: "Group B",
        titleA: "Hamburg",
        titleB: "Eulen",
        groupB: "Group B",
        iconA: "assets/image1.png",
        iconB: "assets/image2.png"),
    Schedule(
        groupA: "Group B",
        titleA: "Hamburg",
        titleB: "Eulen",
        groupB: "Group B",
        iconA: "assets/image1.png",
        iconB: "assets/image2.png"),
    Schedule(
        groupA: "Group B",
        titleA: "Hamburg",
        titleB: "Eulen",
        groupB: "Group B",
        iconA: "assets/image1.png",
        iconB: "assets/image2.png"),
    Schedule(
        groupA: "Group B",
        titleA: "Hamburg",
        titleB: "Eulen",
        groupB: "Group B",
        iconA: "assets/image1.png",
        iconB: "assets/image2.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 26),
            // appBar
            Row(children: [
              Container(
                decoration: BoxDecoration(color: Color(0xffFFFFFF)),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                    )),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.14),
              Text(
                "GAME SCHEDULE",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w400,
                  // color: Color(0xff222222),
                ),
                textAlign: TextAlign.center,
              )
            ]),
            SizedBox(height: 10),
            // body
            Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Color(0xff4D4D4D),
                    borderRadius: BorderRadius.circular(4)),
                child: Text("Sun, 2021 June 27 at 15:30",
                    style: TextStyle(fontSize: 14, color: Colors.white))),

            // list one
            SizedBox(height: 4),
            ...(item1).map((element) {
              return listType(context, element);
            }).toList(),
            SizedBox(height: 10),
            Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Color(0xff4D4D4D),
                    borderRadius: BorderRadius.circular(4)),
                child: Text("Sun, 2021 June 27 at 15:30",
                    style: TextStyle(fontSize: 14, color: Colors.white))),
            SizedBox(height: 4),
            // list two
            ...(item2).map((element) {
              return listType(context, element);
            }).toList(),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade100,
    );
  }
}

Widget listType(BuildContext context, Schedule element) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, bottom: 6, top: 8),
    height: MediaQuery.of(context).size.height * 0.125,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(4)),
    child: Row(
      children: [
        Container(
            padding: EdgeInsets.only(top: 11, bottom: 11, left: 6, right: 2),
            child: Image.asset(element.iconA.toString())),
        Container(
          padding: EdgeInsets.only(top: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(element.titleA.toString(),
                  style: TextStyle(
                      color: Color(0xff292B23),
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              Text(
                element.groupA.toString(),
                style: TextStyle(
                    color: Color(0xff585954), fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 35),
            child: Text(
              "VS",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
          ),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(top: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(element.titleB.toString(),
                      style: TextStyle(
                          color: Color(0xff292B23),
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  Text(
                    element.groupB.toString(),
                    style: TextStyle(
                        color: Color(0xff585954), fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 4, bottom: 11, left: 6, right: 2),
                child: Image.asset(element.iconB.toString())),
          ],
        ),
      ],
    ),
  );
}
