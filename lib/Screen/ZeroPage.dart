import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hsvh/Screen/Football/FootballPage.dart';
import 'package:hsvh/Screen/Football/ProfilePage.dart';
import 'package:hsvh/Screen/Home/HomePage.dart';
import 'package:hsvh/Screen/oneIsToTwo/GameResultsPage.dart';
import 'package:hsvh/Screen/oneIsToTwo/NewsPage.dart';
import 'package:hsvh/Screen/Shop/ShopPage.dart';
import 'package:hsvh/Screen/oneIsToTwo/SchedulePage.dart';
import 'package:hsvh/Screen/oneIsToTwo/StandingsPage.dart';
import 'package:hsvh/Screen/oneIsToTwo/TeamsPage.dart';
import 'package:hsvh/auth/LoginPage.dart';
import 'package:hsvh/controllers/ZeroPageController.dart';

class ZeroPage extends StatefulWidget {
  //const ZeroPage({Key? key}) : super(key: key);
  final selectedIndex;
  ZeroPage({this.selectedIndex});
  @override
  _ZeroPageState createState() => _ZeroPageState();
}

class _ZeroPageState extends State<ZeroPage> {
  final ZeroPageController controller2 = Get.put(ZeroPageController());
  List<Widget> Screens = [HomePage(), SizedBox(), ShopPage(), ProfilePage()];
  List<Widget> SubMenuScreens = [
    TeamsPage(),
    StandingsPage(),
    NewsPage(),
    GameResultsPage(),
    SchedulePage()
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller2.changeTabIndex(widget.selectedIndex);
    FirebaseAuth.instance.userChanges().listen((User? user) async {
      if (user == null) {
        print('User is currently signed out!');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } else {
        print(user.phoneNumber == null);
        print('User is signed in! ${user.phoneNumber}');
        // PhoneNumber phoneNumber = await PhoneNumberUtil().parse(user.phoneNumber);
        // print(phoneNumber.countryCode);

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<ZeroPageController>(
      builder: (controller) {
        return Scaffold(
          body: controller.screenIndex.value != 1
              ? Screens[controller.screenIndex.value]
              : SubMenuScreens[controller.subMenuIndex.value],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 8,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10)),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/icons/Home.png')),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/icons/feed.png')),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag_outlined),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/icons/football.png')),
                    label: '',
                  ),
                ],
                currentIndex: controller.selectedIndex.value,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
                onTap: (index) {
                  controller.changeTabIndex(index);
                  if (index == 1) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (ctx) => AlertDialog(
                        //title: Text("Alert Dialog Box"),
                        backgroundColor: Color.fromRGBO(0, 25, 44, 1),
                        insetPadding: EdgeInsets.only(top: height * 0.575),
                        contentPadding: EdgeInsets.zero,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        content: Builder(builder: (context) {
                          return Container(
                              height: height * 0.25,
                              width: width,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              controller.changeSubMenuIndex(0);
                                            },
                                            icon: ImageIcon(
                                              AssetImage(
                                                  'assets/icons/team.png'),
                                              color: controller
                                                          .subMenuIndex.value ==
                                                      0
                                                  ? Colors.red
                                                  : Colors.white,
                                            ),
                                            iconSize: height * 0.07,
                                          ),
                                          Text(
                                            'TEAM',
                                            style: TextStyle(
                                                fontSize: height * 0.015,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              controller.changeSubMenuIndex(1);
                                            },
                                            icon: ImageIcon(
                                              AssetImage(
                                                  'assets/icons/standings.png'),
                                              color: controller
                                                          .subMenuIndex.value ==
                                                      1
                                                  ? Colors.red
                                                  : Colors.white,
                                            ),
                                            iconSize: height * 0.07,
                                          ),
                                          Text(
                                            'STANDINGS',
                                            style: TextStyle(
                                                fontSize: height * 0.015,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              controller.changeSubMenuIndex(2);
                                            },
                                            icon: ImageIcon(
                                              AssetImage(
                                                  'assets/icons/news.png'),
                                              color: controller
                                                          .subMenuIndex.value ==
                                                      2
                                                  ? Colors.red
                                                  : Colors.white,
                                            ),
                                            iconSize: height * 0.07,
                                          ),
                                          Text(
                                            'NEWS',
                                            style: TextStyle(
                                                fontSize: height * 0.015,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: width * 0.15,
                                        right: width * 0.15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                controller
                                                    .changeSubMenuIndex(3);
                                              },
                                              icon: ImageIcon(
                                                AssetImage(
                                                    'assets/icons/GameResults.png'),
                                                color: controller.subMenuIndex
                                                            .value ==
                                                        3
                                                    ? Colors.red
                                                    : Colors.white,
                                              ),
                                              iconSize: height * 0.07,
                                            ),
                                            Text(
                                              'GAME RESULTS',
                                              style: TextStyle(
                                                  fontSize: height * 0.015,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                controller
                                                    .changeSubMenuIndex(4);
                                              },
                                              icon: ImageIcon(
                                                AssetImage(
                                                    'assets/icons/schedule.png'),
                                                color: controller.subMenuIndex
                                                            .value ==
                                                        4
                                                    ? Colors.red
                                                    : Colors.white,
                                              ),
                                              iconSize: height * 0.07,
                                            ),
                                            Text(
                                              'SCHEDULE',
                                              style: TextStyle(
                                                  fontSize: height * 0.015,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                        }),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                topLeft: Radius.circular(50))),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
