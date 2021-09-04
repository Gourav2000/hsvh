import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsvh/Screen/Shop/shopPageDetail.dart';
import 'package:hsvh/controllers/Shop/ShopPageController.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final ShopPageController controller = Get.put(ShopPageController());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<ShopPageController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade50,
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          title: Row(
            children: [
              Spacer(
                flex: 2,
              ),
              Text(
                'MarketPlace',
                style: TextStyle(
                    color: Color(0xff1E2022),
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
              Spacer(
                flex: 3,
              )
            ],
          ),
        ),
        body: Container(
          height: height,
          width: width,
          color: Colors.grey.shade100,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: width * 0.05,
                right: width * 0.05,
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none),
                      fillColor: Colors.white,
                      filled: true,
                      hoverColor: Colors.white,
                      focusColor: Colors.white,
                    ),
                  ),
                  CarouselSlider.builder(
                    itemCount: 5,
                    options: CarouselOptions(
                        height: height * 0.225,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          controller.updateSlideIndex(index);
                          return false;
                        }),
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.02, left: 5, right: 5),
                      child: Container(
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 0.5,
                              ),
                            ],
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/screenshot.jpeg'))),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.01),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return index == controller.slideIndex.value
                              ? Container(
                                  width: width * 0.05,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blue,
                                  ),
                                )
                              : Container(
                                  width: width * 0.05,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    //borderRadius: BorderRadius.circular(20),
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                  ),
                                );
                        })),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.015),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.updateSelectedFeild(0);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: controller.selectedFeild.value == 0
                                    ? Colors.indigo
                                    : Colors.grey.shade50,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'All',
                                style: TextStyle(
                                    color: controller.selectedFeild.value == 0
                                        ? Colors.white
                                        : Colors.indigo,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.updateSelectedFeild(1);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: controller.selectedFeild.value == 1
                                    ? Colors.indigo
                                    : Colors.grey.shade50,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Popular',
                                style: TextStyle(
                                    color: controller.selectedFeild.value == 1
                                        ? Colors.white
                                        : Colors.indigo,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.updateSelectedFeild(2);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: controller.selectedFeild.value == 2
                                    ? Colors.indigo
                                    : Colors.grey.shade50,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Trending',
                                style: TextStyle(
                                    color: controller.selectedFeild.value == 2
                                        ? Colors.white
                                        : Colors.indigo,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.updateSelectedFeild(3);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: controller.selectedFeild.value == 3
                                    ? Colors.indigo
                                    : Colors.grey.shade50,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Recommended',
                                style: TextStyle(
                                    color: controller.selectedFeild.value == 3
                                        ? Colors.white
                                        : Colors.indigo,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: width * 0.5,
                          childAspectRatio: 10 / 16,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      itemCount: 5,
                      itemBuilder: (BuildContext ctx, index) {
                        return InkWell(
                          // market detail place
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ShopPageDetail()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(0.2),
                            child: Column(
                              children: [
                                Container(
                                  height: height * 0.2,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                    image: DecorationImage(
                                        image: AssetImage('assets/messi.jpeg'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: width * 0.028,
                                        top: height * 0.008),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: height * 0.0025,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Handball Sports Verein',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height * 0.0025,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Hamburg - Kids Hummel',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height * 0.0025,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Trikot 2020/2021',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height * 0.009,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 2),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                          colors: [
                                                                        Color(
                                                                            0xff465A8D),
                                                                        Color(
                                                                            0xff594B63),
                                                                      ]),
                                                                  shape: BoxShape
                                                                      .circle),
                                                          height:
                                                              height * 0.0175,
                                                          width:
                                                              height * 0.0175,
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.014,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                          colors: [
                                                                        Color(
                                                                            0xffC22930),
                                                                        Color(
                                                                            0xff753642),
                                                                      ]),
                                                                  shape: BoxShape
                                                                      .circle),
                                                          height:
                                                              height * 0.0175,
                                                          width:
                                                              height * 0.0175,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 2),
                                                  Text(
                                                    '59,99 \$',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffC41C27),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12),
                                                  )
                                                ],
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height: height * 0.005,
                                            // ),

                                            //second button buynow
                                            Container(
                                              height: height * 0.033,
                                              width: width * 0.25,
                                              padding:
                                                  EdgeInsets.only(right: 10),
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary:
                                                              Color(0xffA4BAE1),
                                                          onPrimary:
                                                              Colors.white,
                                                          shape:
                                                              StadiumBorder()),
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Buy Now",
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  )),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
