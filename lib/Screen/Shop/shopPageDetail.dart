import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class ShopPageDetail extends StatefulWidget {
  @override
  _ShopPageDetailState createState() => _ShopPageDetailState();
}

class _ShopPageDetailState extends State<ShopPageDetail> {
  int changeToggle = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade50,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Row(children: [
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
          ])),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return true;
        },
        child: SingleChildScrollView(
            child: Container(
          child: Column(
            children: [
              // first BLOCK 1.
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 14),
                padding: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //title
                    Container(
                      padding: EdgeInsets.only(
                          top: height * 0.04, bottom: height * 0.015),
                      child: Text(
                        "JERSEYS",
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff002B7A)),
                      ),
                    ),
                    // jersey information
                    Container(
                      height: height * 0.07,
                      width: 263,
                      padding: EdgeInsets.only(bottom: height * 0.017),
                      child: Text(
                        "Handball Sport Verein Hamburg – Unisex Hummel Trikot 2020/2021",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ),
                    // jersey price
                    Container(
                      padding: EdgeInsets.only(bottom: height * 0.017),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(13),
                            child: Image.asset(
                              "assets/\$.png",
                              fit: BoxFit.fitHeight,
                              height: 12,
                              width: 11,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "90.99",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                                color: Color(0xff292B23)),
                          )
                        ],
                      ),
                    ),
                    //jersey image
                    Container(
                        height: height * 0.47,
                        width: width * 0.7,
                        child: Image.asset(
                          "assets/jerseyImage.png",
                          fit: BoxFit.cover,
                        )),
                    //jersey name title
                    Container(
                        padding: EdgeInsets.only(top: height * 0.017, left: 4),
                        child: Text(
                          "Handball Sport Verein Hamburg – Unisex Hummel Trikot 2020/2021",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        )),
                    // jersey size
                    Container(
                      padding: EdgeInsets.only(
                        top: height * 0.025,
                        left: 4,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // // sizes,fit,length etc..
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: width * 0.005),
                                width: MediaQuery.of(context).size.width * 0.44,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    jerseySize1(height),
                                    SizedBox(width: width * 0.060),
                                    jerseySize2(height),
                                  ],
                                ),
                              ),
                            ),
                            // //color ,add to cart ,favorite
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                jerseyColor(height, width),
                                jerseyFavorite(width, height),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    //button for Buy Now
                    buyNow(),
                  ],
                ),
              ),
              SizedBox(height: height * 0.020),
              //second BLOCK 2.
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 14),
                padding: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // review
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.030),
                      child: Text(
                        "Reviews",
                        style: TextStyle(
                            color: Color(0xff292B23),
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    ),
                    SizedBox(height: height * 0.012),
                    //latest and helpful
                    FlutterToggleTab(
                      height: height * 0.06,
                      width: width * 0.2,
                      borderRadius: 0,
                      selectedIndex: changeToggle,
                      selectedLabelIndex: (index) {
                        setState(() {
                          changeToggle = index;
                        });
                      },
                      selectedBackgroundColors: [Color(0xffFFFFFF)],
                      unSelectedBackgroundColors: [Color(0xffFAFBFD)],
                      labels: ["Latest", "Helpful"],
                      selectedTextStyle: TextStyle(
                          color: Color(0xff3E4237),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                      unSelectedTextStyle: TextStyle(
                          color: Color(0xff3E4237),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    // comments ,details and rating
                    Container(
                        height: height * 0.1,
                        padding: EdgeInsets.only(top: height * 0.029),
                        child: Text(
                          "So Comfortable to wear and Nice Quality",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 19),
                        )),
                    // // details
                    Container(
                        height: height * 0.165,
                        padding: EdgeInsets.only(top: height * 0.012),
                        child: Text(
                            "Our game changer development lifecycle enables actionable, company-wide architectures. Proactively aligning effectively end-to-end visibilities is crucial to our wholesale agile workflow. We aim to strategically.",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xff585954)))),
                    // // ratings
                    Image.asset("assets/Rating.png"),
                    // divider
                    Padding(
                      padding: EdgeInsets.only(bottom: height * 0.016),
                      child: Divider(thickness: 1),
                    ),
                    // name , pic
                    Container(
                      height: height * 0.1,
                      child: ListTile(
                        leading: Container(
                            child: Image.asset("assets/reviewPic.png")),
                        title: Text("Sallie Butler",
                            style: TextStyle(
                                color: Color(0xff696D6E),
                                fontWeight: FontWeight.w600)),
                        subtitle: Text("Ultraboost 19 Shoes",
                            style: TextStyle(
                                color: Color(0xff6F8738),
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
      backgroundColor: Colors.grey.shade200,
    );
  }
}

/*







































*/
// customssssssss//

Widget jerseySize1(double height) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: height * 0.007),
      Text(
        "Fit:",
        style: TextStyle(color: Color(0xff585954), fontWeight: FontWeight.w400),
      ),
      SizedBox(height: height * 0.007),
      Text(
        "Length:",
        style: TextStyle(color: Color(0xff585954), fontWeight: FontWeight.w400),
      ),
      SizedBox(height: height * 0.007),
      Text(
        "Comfort:",
        style: TextStyle(color: Color(0xff585954), fontWeight: FontWeight.w400),
      ),
      SizedBox(height: height * 0.007),
      Text(
        "Quality:",
        style: TextStyle(color: Color(0xff585954), fontWeight: FontWeight.w400),
      ),
    ],
  );
}

Widget jerseySize2(double height) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: height * 0.007),
      FittedBox(
        child: Text(
          "Perfect",
          overflow: TextOverflow.fade,
          style: TextStyle(
            color: Color(0xff585954),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      SizedBox(height: height * 0.007),
      FittedBox(
        child: Text(
          "Runs long",
          overflow: TextOverflow.clip,
          style:
              TextStyle(color: Color(0xff585954), fontWeight: FontWeight.w400),
        ),
      ),
      SizedBox(height: height * 0.007),
      FittedBox(
        child: Text(
          "Comfortable",
          overflow: TextOverflow.clip,
          style:
              TextStyle(color: Color(0xff585954), fontWeight: FontWeight.w400),
        ),
      ),
      SizedBox(height: height * 0.007),
      FittedBox(
        child: Text(
          "Regular",
          overflow: TextOverflow.clip,
          style:
              TextStyle(color: Color(0xff585954), fontWeight: FontWeight.w400),
        ),
      ),
    ],
  );
}

Widget jerseyColor(double height, double width) {
  return Container(
    padding: EdgeInsets.only(right: 16),
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xff465A8D),
                Color(0xff594B63),
              ]),
              shape: BoxShape.circle),
          height: height * 0.0230,
          width: height * 0.0230,
        ),
        SizedBox(
          width: width * 0.014,
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffC22930),
                Color(0xff753642),
              ]),
              shape: BoxShape.circle),
          height: height * 0.0230,
          width: height * 0.0230,
        ),
      ],
    ),
  );
}

Widget jerseyFavorite(double width, double height) {
  return Padding(
    padding: EdgeInsets.only(bottom: height * 0.030),
    child: Row(
      children: [
        Image.asset(
          "assets/cart.png",
        ),
        SizedBox(width: width * 0.0340),
        Image.asset(
          "assets/c.png",
        ),
        SizedBox(width: width * 0.0340),
        Icon(Icons.favorite_border, color: Color(0xffA2C4D4))
      ],
    ),
  );
}

Widget buyNow() {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.only(right: 6, bottom: 4),
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xffA4BAE1),
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          elevation: 0,
        ),
        onPressed: () {},
        child: Text(
          "Buy Now",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
        )),
  );
}
