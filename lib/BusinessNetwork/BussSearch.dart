import 'package:flutter/material.dart';

class BusinessSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  hintText: 'Manager',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none),
                  fillColor: Colors.white,
                  filled: true,
                  hoverColor: Colors.white,
                  focusColor: Colors.white,
                ),
              ),
            ),
            //divider
            Padding(
              padding:
                  EdgeInsets.only(left: 13, right: 13, top: 18, bottom: 10),
              child: Row(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    "32 result",
                    style: TextStyle(
                        color: Color(0xff4C4C4C), fontWeight: FontWeight.w400),
                  ),
                ),
                Expanded(
                    child: Divider(
                  thickness: 1,
                )),
              ]),
            ),
            Container(
              height: height * 0.75,
              padding:
                  EdgeInsets.only(left: 13, right: 13, top: 18, bottom: 10),
              child: ListView.builder(
                itemCount: 26,
                itemBuilder: (context, index) {
                  return Container(
                    height: height * 0.12,
                    padding: EdgeInsets.only(top: 9, bottom: 6, left: 16),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/temp.png"),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.05),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Emmerich-Kassulke",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 18),
                              ),
                              SizedBox(height: height * 0.006),
                              Text(
                                "Manager",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff4C4C4C),
                                    fontSize: 14),
                              ),
                              SizedBox(height: height * 0.008),
                              Text(
                                "Abstergo Ltd.",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color(0xff4C4C4C)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade100,
    );
  }
}
