import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hsvh/controllers/Parking/ParkingPageController.dart';

class ParkingPage extends StatefulWidget {
  const ParkingPage({Key? key}) : super(key: key);

  @override
  _ParkingPageState createState() => _ParkingPageState();
}

class _ParkingPageState extends State<ParkingPage> {
  final ParkingPageController controller = Get.put(ParkingPageController());
  static const LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GetBuilder<ParkingPageController>(
      builder: (controller) {
        return SafeArea(
            child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.grey.shade50,
            centerTitle: true,
            title: Text(
              "Parking Ticket",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                iconSize: 30,
                color: Colors.black,
                onPressed: () {},
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                  icon: Icon(Icons.search),
                  iconSize: 30,
                  color: Colors.black,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          body: Container(
            width: width,
            height: height,
            color: Colors.grey.shade50,
            child: Stack(
              children: [
                GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition:
                      CameraPosition(target: _center, zoom: 12.0),
                  zoomControlsEnabled: false,
                ),
                Positioned(
                    right: 20,
                    bottom: height * 0.30,
                    child: InkWell(
                      onTap: () {
                        controller.recenterLocation(_center);
                      },
                      child: Image.asset('assets/icons/Group 9965.png'),
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    constraints: BoxConstraints(maxHeight: height * 0.30),
                    decoration: BoxDecoration(color: Colors.transparent),
                    //color: Colors.transparent,
                    child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              buildModalBottomSheet(width, height);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Card(
                                elevation: 2.0,
                                shape: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 20.0, top: 15),
                                                    child: Text(
                                                      "Parkplatz",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 19.0),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 20.0),
                                                    child: Text(
                                                      "Blucherpl. 1A, 10961",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          //fontWeight: FontWeight.bold,
                                                          fontSize: 17.0),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 20.0),
                                                    child: Text(
                                                      "Berlin, Germany",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 17.0),
                                                    ),
                                                  ),
                                                ],
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                              ),
                                              constraints: BoxConstraints(
                                                  maxWidth: width * 0.60),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 15.0),
                                              child: Image.asset(
                                                'assets/Rectangle 473.png',
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
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ));
      },
    );
  }

  void _onMapCreated(GoogleMapController _controller) {
    controller.updateMapController(_controller);
  }

  buildModalBottomSheet(double width, double height) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return GetBuilder<ParkingPageController>(builder: (controller) {
            return Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(top: 5.0),
                        width: width,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Divider(
                                thickness: 4,
                                color: Colors.grey,
                                indent: width * 0.42,
                                endIndent: width * 0.42,
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Image.asset('assets/Group 9966.png'),
                            SizedBox(
                              height: 20.0,
                            ),
                            CircleAvatar(
                              radius: 30,
                              child: Image.asset('assets/User.png'),
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Text(
                              "Lottie Poole",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/icons/1200px-Real_Madrid_CF.svg.png',
                                      height: 50,
                                      width: 50,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Fuchse",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: Text(
                                    "VS",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/icons/image 9.png',
                                      height: 50,
                                      width: 50,
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      "Eulen",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Divider(
                              thickness: 2,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "SEAT",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "C58",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.0),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "DATE",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "28 Sep",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.0),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "SEAT",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "20:10",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.0),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Divider(
                              thickness: 2,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Parkplatz",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "Blucherpl. 1A, 10961",
                                  style: TextStyle(
                                      color: Colors.black,
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "Berlin, Germany",
                                  style: TextStyle(
                                      color: Colors.black,
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "B1",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "Parking Place",
                                  style: TextStyle(
                                      color: Colors.black,
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: Container(
                                    width: width,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Navigate Through Google Maps",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                        SizedBox(
                                          width: 15.0,
                                        ),
                                        Image.asset(
                                            'assets/icons/logos_google-maps.png')
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                ),
              ],
            );
          });
        });
  }
}
