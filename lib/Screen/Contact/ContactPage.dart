import 'package:flutter/material.dart';
import 'package:hsvh/Screen/Contact/PersonalConversationPage.dart';
import 'package:hsvh/controllers/Contact/ContactPageController.dart';
import 'package:get/get.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final ContactPageController controller = Get.put(ContactPageController());
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //controller.getAllContacts();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<ContactPageController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          // bottomNavigationBar: Container(
          //   decoration: BoxDecoration(
          //     boxShadow: <BoxShadow>[
          //       BoxShadow(
          //         color: Colors.grey,
          //         blurRadius: 8,
          //       ),
          //     ],
          //   ),
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.only(
          //         topRight: Radius.circular(10), topLeft: Radius.circular(10)),
          //     child: BottomNavigationBar(
          //       type: BottomNavigationBarType.fixed,
          //       items: <BottomNavigationBarItem>[
          //         BottomNavigationBarItem(
          //           icon: ImageIcon(AssetImage('assets/icons/Home.png')),
          //           label: '',
          //         ),
          //         BottomNavigationBarItem(
          //           icon: ImageIcon(AssetImage('assets/icons/feed.png')),
          //           label: '',
          //         ),
          //         BottomNavigationBarItem(
          //           icon: Icon(Icons.shopping_bag_outlined),
          //           label: '',
          //         ),
          //         BottomNavigationBarItem(
          //           icon: ImageIcon(AssetImage('assets/icons/football.png')),
          //           label: '',
          //         ),
          //       ],
          //       currentIndex: controllers.selectedIndex.value,
          //       selectedItemColor: Colors.blue,
          //       unselectedItemColor: Colors.grey,
          //       onTap: (index) {
          //         controller.changeTabIndex(index);
          //         if (index == 1) {
          //           showDialog(
          //             context: context,
          //             barrierDismissible: false,
          //             builder: (ctx) => AlertDialog(
          //               //title: Text("Alert Dialog Box"),
          //               backgroundColor: Color.fromRGBO(0, 25, 44, 1),
          //               insetPadding: EdgeInsets.only(top: height * 0.575),
          //               contentPadding: EdgeInsets.zero,
          //               clipBehavior: Clip.antiAliasWithSaveLayer,
          //               content: Builder(builder: (context) {
          //                 return Container(
          //                     height: height * 0.25,
          //                     width: width,
          //                     child: Column(
          //                       children: [
          //                         Row(
          //                           mainAxisAlignment:
          //                           MainAxisAlignment.spaceAround,
          //                           children: [
          //                             Column(
          //                               children: [
          //                                 IconButton(
          //                                   onPressed: () {
          //                                     Navigator.of(context).pop();
          //                                     controller.changeSubMenuIndex(0);
          //                                   },
          //                                   icon: ImageIcon(
          //                                     AssetImage(
          //                                         'assets/icons/team.png'),
          //                                     color: controller
          //                                         .subMenuIndex.value ==
          //                                         0
          //                                         ? Colors.red
          //                                         : Colors.white,
          //                                   ),
          //                                   iconSize: height * 0.07,
          //                                 ),
          //                                 Text(
          //                                   'TEAM',
          //                                   style: TextStyle(
          //                                       fontSize: height * 0.015,
          //                                       color: Colors.white),
          //                                 )
          //                               ],
          //                             ),
          //                             Column(
          //                               children: [
          //                                 IconButton(
          //                                   onPressed: () {
          //                                     Navigator.of(context).pop();
          //                                     controller.changeSubMenuIndex(1);
          //                                   },
          //                                   icon: ImageIcon(
          //                                     AssetImage(
          //                                         'assets/icons/standings.png'),
          //                                     color: controller
          //                                         .subMenuIndex.value ==
          //                                         1
          //                                         ? Colors.red
          //                                         : Colors.white,
          //                                   ),
          //                                   iconSize: height * 0.07,
          //                                 ),
          //                                 Text(
          //                                   'STANDINGS',
          //                                   style: TextStyle(
          //                                       fontSize: height * 0.015,
          //                                       color: Colors.white),
          //                                 )
          //                               ],
          //                             ),
          //                             Column(
          //                               children: [
          //                                 IconButton(
          //                                   onPressed: () {
          //                                     Navigator.of(context).pop();
          //                                     controller.changeSubMenuIndex(2);
          //                                   },
          //                                   icon: ImageIcon(
          //                                     AssetImage(
          //                                         'assets/icons/news.png'),
          //                                     color: controller
          //                                         .subMenuIndex.value ==
          //                                         2
          //                                         ? Colors.red
          //                                         : Colors.white,
          //                                   ),
          //                                   iconSize: height * 0.07,
          //                                 ),
          //                                 Text(
          //                                   'NEWS',
          //                                   style: TextStyle(
          //                                       fontSize: height * 0.015,
          //                                       color: Colors.white),
          //                                 )
          //                               ],
          //                             ),
          //                           ],
          //                         ),
          //                         Padding(
          //                           padding: EdgeInsets.only(
          //                               left: width * 0.15,
          //                               right: width * 0.15),
          //                           child: Row(
          //                             mainAxisAlignment:
          //                             MainAxisAlignment.spaceAround,
          //                             children: [
          //                               Column(
          //                                 children: [
          //                                   IconButton(
          //                                     onPressed: () {
          //                                       Navigator.of(context).pop();
          //                                       controller
          //                                           .changeSubMenuIndex(3);
          //                                     },
          //                                     icon: ImageIcon(
          //                                       AssetImage(
          //                                           'assets/icons/GameResults.png'),
          //                                       color: controller.subMenuIndex
          //                                           .value ==
          //                                           3
          //                                           ? Colors.red
          //                                           : Colors.white,
          //                                     ),
          //                                     iconSize: height * 0.07,
          //                                   ),
          //                                   Text(
          //                                     'GAME RESULTS',
          //                                     style: TextStyle(
          //                                         fontSize: height * 0.015,
          //                                         color: Colors.white),
          //                                   )
          //                                 ],
          //                               ),
          //                               Column(
          //                                 children: [
          //                                   IconButton(
          //                                     onPressed: () {
          //                                       Navigator.of(context).pop();
          //                                       controller
          //                                           .changeSubMenuIndex(4);
          //                                     },
          //                                     icon: ImageIcon(
          //                                       AssetImage(
          //                                           'assets/icons/schedule.png'),
          //                                       color: controller.subMenuIndex
          //                                           .value ==
          //                                           4
          //                                           ? Colors.red
          //                                           : Colors.white,
          //                                     ),
          //                                     iconSize: height * 0.07,
          //                                   ),
          //                                   Text(
          //                                     'SCHEDULE',
          //                                     style: TextStyle(
          //                                         fontSize: height * 0.015,
          //                                         color: Colors.white),
          //                                   )
          //                                 ],
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                       ],
          //                     ));
          //               }),
          //               shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.only(
          //                       topRight: Radius.circular(50),
          //                       topLeft: Radius.circular(50))),
          //             ),
          //           );
          //         }
          //       },
          //     ),
          //   ),
          // ),
          body: Container(
            height: height,
            width: width,
            color: Colors.grey.shade50,
            child: Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 25.0),
                        child: Container(
                          width: width * 0.80,
                          height: 50,
                          child: Center(
                            child: TextField(
                              textAlignVertical: TextAlignVertical.center,
                              controller: searchController,
                              onChanged: (name) {
                                if (name == "") {
                                  controller.setSearchingValue();
                                } else {
                                  controller.getParticularContact(name);
                                }
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.search,
                                    size: 30,
                                  ),
                                  isDense: true,
                                  hintText: "Search..",
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)))),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text(
                      "Conversation",
                      style: TextStyle(
                          color: Color(0xFF121212),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.searching.value == 1
                              ? controller.filteredContact.length
                              : controller.contactName.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PersonalConversationPage()));
                                },
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 24.0,
                                          backgroundImage:
                                              AssetImage('assets/avatar.png'),
                                          // backgroundImage: NetworkImage(
                                          //   "https://cdn.pixabay.com/photo/2015/03/03/20/42/man-657869_1280.jpg"
                                          // ),
                                          //child: Text(controller.contactName.elementAt(index).substring(0, 1)),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 12.0),
                                            child: Column(
                                              //mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.searching.value ==
                                                          1
                                                      ? controller
                                                              .filteredContact[
                                                          index]
                                                      : controller.contactName
                                                          .elementAt(index),
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  "you: Let's meet",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 17.0,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                SizedBox(
                                                  width: width * 0.65,
                                                  child: Divider(
                                                    thickness: 2.0,
                                                    color: Colors.black54,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
