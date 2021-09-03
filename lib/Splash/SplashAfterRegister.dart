import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hsvh/Screen/ZeroPage.dart';

class SplashAfterRegister extends StatefulWidget {
  const SplashAfterRegister({Key? key}) : super(key: key);

  @override
  _SplashAfterRegisterState createState() => _SplashAfterRegisterState();
}

class _SplashAfterRegisterState extends State<SplashAfterRegister> {
  final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: PageView(
        /// [PageView.scrollDirection] defaults to [Axis.horizontal].
        /// Use [Axis.vertical] to scroll vertically.
        scrollDirection: Axis.horizontal,
        //physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children:  <Widget>[
          Container(
            height: height,
            //color: Colors.red.shade800,
            decoration: BoxDecoration(
              //color: Colors.red.shade800,
              image: DecorationImage(
                image: AssetImage(
                  'assets/slide1.png',
                ),

                fit: BoxFit.cover
              )
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height*0.07,
                ),
                Row(
                  children: [
                    Spacer(),
              InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ZeroPage(selectedIndex: 0,)));
                  },
                  child: Text('Skip    ',style: TextStyle(color: Colors.white),))
                  ],
                ),
                SizedBox(
                  height: height*0.625,
                ),
                Column(
                  children: [
                    Text('See all the',style: TextStyle(color: Colors.white,fontSize: height*0.03),),
                    Text('Upcoming Matches',style: TextStyle(color: Colors.white,fontSize: height*0.03,fontWeight: FontWeight.bold),),
                  ],
                ),
                Spacer(),
                Container(
                  height: height*0.1,
                  width: width,
                  color: Colors.black.withOpacity(0.3),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: width * 0.08,
                              height: 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.01,
                            ),
                            Container(
                              width: width * 0.03,
                              height: 7,
                              decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(20),
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.01,
                            ),
                            Container(
                              width: width * 0.03,
                              height: 7,
                              decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(20),
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      InkWell(
                          onTap: (){
                            print('page 1');

                            controller.animateToPage(1, duration: Duration(milliseconds: 100), curve: Curves.easeIn);
                          },
                          child: Text('Next    ',style: TextStyle(color: Colors.white),))
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: height,
            //color: Colors.indigoAccent,
            decoration: BoxDecoration(
                //color: Colors.red.shade800,
                image: DecorationImage(
                    image: AssetImage(
                      'assets/slide2.png',
                    ),

                    fit: BoxFit.cover
                )
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height*0.07,
                ),
                Row(
                  children: [
                    Spacer(),
                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ZeroPage(selectedIndex: 0,)));
                        },
                        child: Text('Skip    ',style: TextStyle(color: Colors.white),))
                  ],
                ),
                SizedBox(
                  height: height*0.625,
                ),
                Column(
                  children: [
                    Text('Get into action by making',style: TextStyle(color: Colors.white,fontSize: height*0.03),),
                    Text('Your Predictions',style: TextStyle(color: Colors.white,fontSize: height*0.03,fontWeight: FontWeight.bold),),
                  ],
                ),
                Spacer(),
                Container(
                  height: height*0.1,
                  width: width,
                  color: Colors.black.withOpacity(0.3),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: width * 0.03,
                              height: 7,
                              decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(20),
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.01,
                            ),
                            Container(
                              width: width * 0.08,
                              height: 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                            ),

                            SizedBox(
                              width: width * 0.01,
                            ),
                            Container(
                              width: width * 0.03,
                              height: 7,
                              decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(20),
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      InkWell(
                          onTap: (){
                            controller.animateToPage(2, duration: Duration(milliseconds: 100), curve: Curves.easeIn);
                          },
                          child: Text('Next    ',style: TextStyle(color: Colors.white),))
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: height,
            //color: Colors.blue,
            decoration: BoxDecoration(
                //color: Colors.red.shade800,
                image: DecorationImage(
                    image: AssetImage(
                      'assets/slide3.png',
                    ),

                    fit: BoxFit.cover
                )
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height*0.07,
                ),
                Row(
                  children: [
                    Spacer(),
                    Text('Skip    ',style: TextStyle(color: Colors.transparent),)
                  ],
                ),
                SizedBox(
                  height: height*0.625,
                ),
                Column(
                  children: [
                    Text('What are you waiting for',style: TextStyle(color: Colors.white,fontSize: height*0.03),),
                    Text('Get into Action',style: TextStyle(color: Colors.white,fontSize: height*0.03,fontWeight: FontWeight.bold),),
                  ],
                ),
                Spacer(),
                Container(
                  height: height*0.1,
                  width: width,
                  color: Colors.black.withOpacity(0.3),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: width * 0.03,
                              height: 7,
                              decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(20),
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.01,
                            ),
                            Container(
                              width: width * 0.03,
                              height: 7,
                              decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(20),
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),


                            SizedBox(
                              width: width * 0.01,
                            ),
                            Container(
                              width: width * 0.08,
                              height: 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      InkWell(
                          onTap: (){
                            //controller.animateTo(1, duration: Duration(milliseconds: 100), curve: Curves.ease);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ZeroPage(selectedIndex: 0,)));
                          },
                          child: Text('Get Started    ',style: TextStyle(color: Colors.white),))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}
