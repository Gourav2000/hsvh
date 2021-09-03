import 'package:flutter/material.dart';
import 'package:hsvh/Screen/Contact/ContactPage.dart';
import 'package:hsvh/Screen/Events/EventsPage.dart';
import 'package:hsvh/Screen/Football/ProfilePage.dart';
import 'package:hsvh/Screen/Parking/ParkingPage.dart';
import 'package:hsvh/BusinessNetwork/BusinessNetwork.dart';
import 'package:hsvh/Screen/Prediction/PredictionPage.dart';

class CustomVIPDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.67,
      child: Drawer(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //icon ,name and edit option start
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height * 0.14,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned(
                          left: 26,
                          top: MediaQuery.of(context).size.height * 0.036,
                          child: Image.asset("assets/crown.png", height: 30)),
                      Container(
                        padding: EdgeInsets.only(
                            left: 26,
                            top: MediaQuery.of(context).size.height * 0.066),
                        child: CircleAvatar(
                            backgroundImage: AssetImage("assets/drawer.png"),
                            radius: 25),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.012),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 26, vertical: 6),
                    height: height * 0.08,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Lottie Poole",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Color(0xff002B7A),
                                )),
                            SizedBox(width: 10),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ProfilePage()));
                                },
                                child: Image.asset("assets/edit.png")),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text("Gerflow",
                              style: TextStyle(
                                  color: Color(0xff002B7A),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.012),
                Divider(thickness: 2),
              ],
            ),
          ),
          //icon ,name and edit option start ends
          //sub menus for vip start
          Container(
            height: MediaQuery.of(context).size.height * 0.558,
            width: double.infinity,
            // padding: EdgeInsets.only(left: 26),
            child: Stack(
              children: [
                Image.asset(
                  "assets/dropshadow.png",
                  fit: BoxFit.fitHeight,
                  width: double.infinity,
                ),
                Positioned(
                  top: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    padding: EdgeInsets.only(top: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EventsPage()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: customSubMenu("Events", "events"),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04),
                        InkWell(
                          onTap: () async {
                            await Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ShopPageNew()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 17),
                            child: customSubMenu(
                                "Business Network", "businessNet"),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ParkingPage()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: customSubMenu(
                                "Parking Ticket", "parkingticket"),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PredictionPage()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: customSubMenu("Teamwork", "teamwork"),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ContactPage()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: customSubMenu("My Contacts", "mycontact"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //sub menus for vip ends

          //setting option
          Container(
            padding: EdgeInsets.symmetric(horizontal: 26),
            child: Row(
              children: [
                Image.asset("assets/setting.png", height: 16),
                SizedBox(width: 20),
                Text("Settings",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600))
              ],
            ),
          ),
          //setting option ends
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        ],
      )),
    );
  }
}

Widget customSubMenu(String text1, String tximage1) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Image.asset("assets/$tximage1.png", height: 20),
      text1 == "Business Network" ? SizedBox(width: 7) : SizedBox(width: 16),
      Text(
        text1,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      )
    ],
  );
}
