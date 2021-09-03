import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsvh/controllers/Football/ProfilePageController.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfilePageController controller = Get.put(ProfilePageController());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<ProfilePageController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade50,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.grey.shade800,
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                }),
          ],
          title: Center(
              child: Text(
            'Profile',
            style: TextStyle(color: Colors.grey.shade800),
          )),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_sharp,
                color: Colors.grey.shade800,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: Container(
          height: height,
          width: width,
          color: Colors.grey.shade50,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height * 0.175,
                  width: height * 0.175,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.indigo, width: 2),
                      color: Colors.grey
                      // image: DecorationImage(
                      //   image: AssetImage('assets/messi.jpeg'),
                      //   fit: BoxFit.cover
                      // )
                      ),
                  child: Column(
                    children: [
                      Spacer(),
                      Row(
                        children: [
                          Spacer(),
                          Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.indigo,
                                //border: Border.all(color: Colors.indigo,width: 2),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(height * 0.0075),
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: height * 0.045),
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Text(
                  'Alex Bristo',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: height * 0.03,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Fan',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: height * 0.03,
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.075, right: width * 0.075),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade300),
                              child: Padding(
                                padding: EdgeInsets.all(height * 0.01),
                                child: Icon(
                                  Icons.notifications_outlined,
                                  color: Colors.grey.shade700,
                                ),
                              )),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Text(
                            'All Notifications',
                            style: TextStyle(color: Colors.grey.shade600),
                          )
                        ],
                      ),
                      Transform.scale(
                        scale: 1.5,
                        child: Switch(
                          onChanged: (value) {
                            controller.changeAllNotifications();
                          },
                          value: controller.AllNotifications.value,
                          activeColor: Colors.blue,
                          activeTrackColor: Colors.blue.shade200,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.075, right: width * 0.075),
                  child: Divider(),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.075, right: width * 0.075),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade300),
                              child: Padding(
                                padding: EdgeInsets.all(height * 0.01),
                                child: Icon(
                                  Icons.person_outline,
                                  color: Colors.grey.shade700,
                                ),
                              )),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Text(
                            'Personal Information',
                            style: TextStyle(color: Colors.grey.shade600),
                          )
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_sharp,
                            color: Colors.grey.shade700,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.0125,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.075, right: width * 0.075),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade300),
                              child: Padding(
                                padding: EdgeInsets.all(height * 0.01),
                                child: Icon(
                                  Icons.lock_outline_sharp,
                                  color: Colors.grey.shade700,
                                ),
                              )),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Text(
                            'Change Password',
                            style: TextStyle(color: Colors.grey.shade600),
                          )
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_sharp,
                            color: Colors.grey.shade700,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.0125,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.075, right: width * 0.075),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade300),
                              child: Padding(
                                padding: EdgeInsets.all(height * 0.01),
                                child: Icon(
                                  Icons.emoji_emotions_outlined,
                                  color: Colors.grey.shade700,
                                ),
                              )),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Text(
                            'Send Feedback',
                            style: TextStyle(color: Colors.grey.shade600),
                          )
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_sharp,
                            color: Colors.grey.shade700,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.0125,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.075, right: width * 0.075),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade300),
                              child: Padding(
                                padding: EdgeInsets.all(height * 0.01),
                                child: Icon(
                                  Icons.help_outline_sharp,
                                  color: Colors.grey.shade700,
                                ),
                              )),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Text(
                            'Help',
                            style: TextStyle(color: Colors.grey.shade600),
                          )
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_sharp,
                            color: Colors.grey.shade700,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
