import 'package:flutter/material.dart';

class Addidas extends StatelessWidget {
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
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.34,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    height: height * 0.18,
                    child: Column(
                      children: [
                        Container(
                            height: height * 0.091,
                            child: Image.asset("assets/addidas.png")),
                        SizedBox(height: height * 0.012),
                        Container(
                          height: height * 0.03,
                          child: Text("adidas",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18)),
                        ),
                        SizedBox(height: height * 0.012),
                        Container(
                          height: height * 0.02,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/2peop.png"),
                              Text("41,616 employees on app")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: height * 0.028,
                    padding: EdgeInsets.only(left: width * 0.056),
                    child: Text(
                      "About us",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff363636),
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: height * 0.12,
                    padding: EdgeInsets.only(
                        left: width * 0.056, top: height * 0.010),
                    child: Text(
                      "Inspired by our heritage, we push the boundaries of culture and human performance. Through sport, we have the power to change lives. Headquartered in Herzogenaurach,",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff4D4D4D),
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.059),
              child: Divider(thickness: 2),
            ),
            SizedBox(height: height * 0.014),
            //headquater, company size,official website,industry
            Container(
              height: height * 0.28,
              width: double.infinity,
              child: Column(
                children: [
                  customColumn(width, "Headquaters", "Herzogenaurach"),
                  SizedBox(height: height * 0.014),
                  customColumn(width, "Company Size", "10001+"),
                  SizedBox(height: height * 0.014),
                  customColumn(width, "Official Website",
                      "https://www.adidas-group.com/"),
                  SizedBox(height: height * 0.014),
                  customColumn(width, "Industry", "Sporting Goods"),
                  SizedBox(height: height * 0.010),
                ],
              ),
            ),

            //divider
            Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.059),
                child: Divider(thickness: 2)),
            customRow("Contact Person", width),
            SizedBox(height: height * 0.01),
            Row(
              children: [
                members("Ruprecht Polenz", "Manager", width, context),
                members("Ruprecht Polenz", "Assistant Manager", width, context),
                members("Ruprecht Polenz", "HR", width, context),
              ],
            )
          ],
        ),
      ),
    );
  }
}

/*





custom Widgets






*/

Widget customColumn(double width, String text1, String text2) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.only(left: width * 0.056),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff363636)),
        ),
        Text(
          text2,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: text1 == "Official Website"
                  ? Color(0xff0029FF)
                  : Color(0xff4D4D4D)),
        ),
      ],
    ),
  );
}

Widget customRow(String text1, double width) {
  return Container(
    padding: EdgeInsets.only(left: width * 0.056),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text1,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 14)),
      ],
    ),
  );
}

Widget members(String text1, String text2, double width, BuildContext context) {
  return Container(
    width: width * 0.24,
    margin: EdgeInsets.only(left: width * 0.056),
    child: Column(
      children: [
        CircleAvatar(
          child: Image.asset(
            "assets/busNet2.png",
            fit: BoxFit.cover,
          ),
          radius: 35,
        ),
        Container(
          height: 19,
          child: FittedBox(
            child: Text(text1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
                maxLines: 1),
          ),
        ),
        Container(
            child: FittedBox(
          child: Text(
            text2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Color(0xff4D4D4D), fontSize: 12),
            maxLines: 1,
          ),
        ))
      ],
    ),
  );
}
