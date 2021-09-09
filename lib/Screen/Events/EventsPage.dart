import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsvh/controllers/Events/EventsPageController.dart';
import 'package:permission_handler/permission_handler.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final EventsPageController controller = Get.put(EventsPageController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _askPermissions();
    //controller.getAllContacts();
  }

  Future<void> _askPermissions() async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      controller.updatePermissionGranted();
      controller.getAllContacts();
    } else {
      _handleInvalidPermissions(permissionStatus);
    }
  }

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      final snackBar = SnackBar(content: Text('Access to contact data denied'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      final snackBar =
          SnackBar(content: Text('Contact data not available on device'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GetBuilder<EventsPageController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
        body: Container(
          height: height,
          width: width,
          color: Colors.grey.shade50,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      iconSize: 30,
                      color: Colors.black,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Text(
                      "Events",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      iconSize: 30,
                      color: Colors.black,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 5.0,
                          shape: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.0),
                                              child: Text(
                                                "Handball 100th Anniversary",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20.0),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                if (controller
                                                    .permissionGranted.value) {
                                                  sharePresenceDialog(
                                                      width, height);
                                                } else {
                                                  final snackBar = SnackBar(
                                                      content: Text(
                                                          'Access to contact data denied'));
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                }
                                              },
                                              child: Container(
                                                height: 40,
                                                constraints: BoxConstraints(
                                                    maxWidth: width * 0.55),
                                                //width: width * 0.55,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black),
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0)),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 8.0),
                                                      child: Text(
                                                          "Share your presence"),
                                                    ),
                                                    IconButton(
                                                      icon: Icon(Icons.share),
                                                      iconSize: 20,
                                                      color:
                                                          Colors.grey.shade700,
                                                      onPressed: () {
                                                        //sharePresenceDialog(width, height);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        constraints: BoxConstraints(
                                            maxWidth: width * 0.60),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 15.0),
                                        child: Image.asset(
                                          'assets/image 8.png',
                                          // height: 50,
                                          // width: 50,
                                        ),
                                      )
                                    ],
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: DottedLine(
                                      direction: Axis.horizontal,
                                      lineLength: double.infinity,
                                      lineThickness: 2.0,
                                      dashLength: 4.0,
                                      dashColor: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: Text(
                                      "Humboldt-Box, Berlin",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                  'assets/icons/calendar 1.png'),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text("22.07")
                                            ],
                                          ),
                                          constraints: BoxConstraints(
                                              maxWidth: width * 0.20),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                  'assets/icons/Group.png'),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text("21:00")
                                            ],
                                          ),
                                          constraints: BoxConstraints(
                                              maxWidth: width * 0.20),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 60,
                                                child: Stack(
                                                  //alignment: Alignment.topRight,
                                                  children: [
                                                    Image.asset(
                                                      'assets/avatar.png',
                                                      height: 30,
                                                      width: 30,
                                                    ),
                                                    Positioned(
                                                      left: 15,
                                                      child: Image.asset(
                                                        'assets/avatar.png',
                                                        height: 30,
                                                        width: 30,
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: 30,
                                                      child: Image.asset(
                                                        'assets/avatar.png',
                                                        height: 30,
                                                        width: 30,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Text("+11")
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          child: Container(
                                            child: Center(
                                              child: Text(
                                                "RSVP",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                color: Color(0xFF002B7A),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.0)),
                                            width: 70,
                                            height: 40,
                                          ),
                                          onTap: () {
                                            displayRSVPDialog(width, height);
                                          },
                                        )
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ));
    });
  }

  displayRSVPDialog(double width, double height) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "You sure you will be attending this event ?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17.0),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/image 8.png',
                  // height: 50,
                  // width: 50,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Handball 100th Anniversary",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "Humboldt-Box, Berlin",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    //fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/calendar 1.png'),
                        SizedBox(
                          width: 5,
                        ),
                        Text("22.07")
                      ],
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/Group.png'),
                        SizedBox(
                          width: 5,
                        ),
                        Text("21:00")
                      ],
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      width: width * 0.3,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF002B7A)),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              fontSize: 17.0,
                              color: Color(0xFF002B7A),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(12.0),
                    width: width * 0.3,
                    decoration: BoxDecoration(
                        color: Color(0xFF002B7A),
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Center(
                      child: Text(
                        "Yes",
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ]),
              )
            ],
          );
        });
  }

  sharePresenceDialog(double width, double height) {
    showDialog(
        context: context,
        builder: (context) {
          return GetBuilder<EventsPageController>(builder: (controller) {
            return Dialog(
              insetPadding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: height * 0.9,
                  width: width * 0.99,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select contacts to share with",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.clear),
                            iconSize: 25,
                          )
                        ],
                      ),
                      Divider(
                        thickness: 2.0,
                        color: Colors.black,
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: controller.contacts.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  (controller.contacts[index].avatar != null &&
                                          controller.contacts[index].avatar!
                                                  .length >
                                              0)
                                      ? CircleAvatar(
                                          radius: 30,
                                          backgroundImage: MemoryImage(
                                              controller
                                                  .contacts[index].avatar!),
                                        )
                                      : CircleAvatar(
                                          radius: 30,
                                          child: Text(controller.contacts[index]
                                              .initials()),
                                        ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 12.0),
                                      child: Column(
                                        //mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: Text(
                                              controller
                                                  .contacts[index].displayName!,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: Text(
                                              controller
                                                  .contacts[index].displayName!,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 17.0,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          SizedBox(
                                            //width: width * 0.65,
                                            child: Divider(
                                              thickness: 2.0,
                                              color: Colors.black54,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    constraints:
                                        BoxConstraints(maxWidth: width * 0.65),
                                  ),
                                ],
                              );
                              // return ListTile(
                              //   title: Text(
                              //     "${controller.contacts[index].displayName}"
                              //   ),
                              //   subtitle: Text(
                              //       "${controller.contacts[index].androidAccountName}"
                              //   ),
                              // );
                            }),
                      ),
                      Container(
                        padding: EdgeInsets.all(12.0),
                        width: width * 0.85,
                        decoration: BoxDecoration(
                            color: Color(0xFF002B7A),
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Center(
                          child: Text(
                            "SHARE",
                            style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }
}
