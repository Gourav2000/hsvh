import 'package:flutter/material.dart';
import 'package:hsvh/Screen/Football/ProfilePage.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(border: Border.all()),
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
                  padding: EdgeInsets.only(
                      left: 26,
                      top: MediaQuery.of(context).size.height * 0.061),
                  child: CircleAvatar(
                      backgroundImage: AssetImage("assets/drawer.png"),
                      radius: 25),
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 26),
                  child: Row(
                    children: [
                      Text("Lottie Poole",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16)),
                      SizedBox(width: 10),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProfilePage()));
                          },
                          child: Image.asset("assets/edit.png")),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.080),
                Divider(thickness: 2),
              ],
            ),
          ),
          //icon ,name and edit option start ends
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
