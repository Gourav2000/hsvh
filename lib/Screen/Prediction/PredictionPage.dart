import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsvh/Screen/Prediction/LeadershipPage.dart';
import 'package:hsvh/Screen/Prediction/PredictionScorePage.dart';
import 'package:hsvh/Screen/Prediction/ResultPredictionPage.dart';
import 'package:hsvh/controllers/Prediction/PredictionPageController.dart';

class PredictionPage extends StatefulWidget {
  const PredictionPage({Key? key}) : super(key: key);

  @override
  _PredictionPageState createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  final PredictionPageController controller = Get.put(PredictionPageController());
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GetBuilder<PredictionPageController>(
        builder: (controller){
          return SafeArea(
              child: Scaffold(
               body: Container(
                 width: width,
                 height: height,
                 color: Colors.grey.shade50,
                 child: SingleChildScrollView(
                   child: Column(
                     children: [
                       Padding(
                         padding: EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             IconButton(
                               icon: Icon(Icons.arrow_back_ios),
                               iconSize: 25,
                               color: Colors.black,
                               onPressed: () {
                                 Navigator.of(context).pop();
                               },
                             ),
                             Container(
                               decoration: BoxDecoration(
                                 color: Colors.black,
                                 borderRadius: BorderRadius.circular(12.0)
                               ),
                               child: Padding(
                                 padding: const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8.0),
                                 child: Row(
                                   children: [
                                     Image.asset(
                                         'assets/icons/Group crown.png',
                                       width: 30,
                                       height: 20,
                                     ),
                                     Text(
                                       "2400",
                                       style: TextStyle(
                                         color: Colors.white,
                                         fontWeight: FontWeight.bold
                                       ),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                       SizedBox(
                         height: 5,
                       ),
                       Image.asset(
                           'assets/adidas.png'
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       InkWell(
                         onTap: (){
                           Navigator.of(context).push(MaterialPageRoute(
                               builder: (context) => LeadershipPage()));
                         },
                         child: Container(
                           width: width * 0.9,
                           height: 60,
                           decoration: BoxDecoration(
                             color: Color(0xFF004170),
                             borderRadius: BorderRadius.circular(15.0)
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               Text(
                                 "Check out the Leadershipboard",
                                 style: TextStyle(
                                   color: Colors.white,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 18.0
                                 ),
                               ),
                               Icon(
                                 Icons.arrow_forward_ios_rounded,
                                 color: Colors.white,
                               )
                             ],
                           ),
                         ),
                       ),
                       SizedBox(
                         height: 30,
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text(
                               "10-08-2021",
                               style: TextStyle(
                                 color: Colors.black,
                                 fontSize: 17.0,
                                 fontWeight: FontWeight.bold
                               ),
                             ),
                             Text(
                               "View All",
                               style: TextStyle(
                                   //color: Colors.black,
                                   fontSize: 17.0,
                                   //fontWeight: FontWeight.bold
                               ),
                             )
                           ],
                         ),
                       ),
                       SizedBox(
                         height: 15,
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                         child: Container(
                           width: width * 0.95,
                           decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(8.0),
                             boxShadow: <BoxShadow>[
                               BoxShadow(
                                 color: Colors.grey.shade300,
                                 blurRadius: 8,
                               ),
                             ],
                           ),
                           child: Padding(
                             padding: const EdgeInsets.only(left: 5.0 , right: 5.0 ,top: 10.0, bottom: 10.0),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                       "Fuchse Berlin",
                                       style: TextStyle(
                                         color: Colors.black,
                                         fontSize: 17.0,
                                         //fontWeight: FontWeight.bold,
                                       ),
                                     )
                                   ],
                                 ),
                                 Column(
                                   children: [
                                     InkWell(
                                       child: Container(
                                         width: 140,
                                         height: 50,
                                         decoration: BoxDecoration(
                                           color: Color(0xFFFB9595),
                                           borderRadius: BorderRadius.circular(17.0)
                                         ),
                                         child: Padding(
                                           padding: const EdgeInsets.only(left:8.0, right: 8.0),
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                             children: [
                                               Text(
                                                 "Predict",
                                                 style: TextStyle(
                                                   color: Colors.white,
                                                   fontSize: 20.0,
                                                   fontWeight: FontWeight.bold
                                                 ),
                                               ),
                                               Icon(
                                                 Icons.arrow_forward_ios_rounded,
                                                 color: Colors.white,
                                                 size: 18.0,
                                               )
                                             ],
                                           ),
                                         ),
                                       ),
                                       onTap: (){
                                         Navigator.of(context).push(MaterialPageRoute(
                                             builder: (context) => PredictionScorePage()));
                                       },
                                     ),
                                     SizedBox(
                                       height: 5,
                                     ),
                                     Text(
                                       "2H30 Left",
                                       style: TextStyle(
                                         color: Colors.black,
                                         fontSize: 17.0,
                                         fontWeight: FontWeight.bold
                                       ),
                                     )
                                   ],
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
                                       "Hamburg",
                                       style: TextStyle(
                                         color: Colors.black,
                                         fontSize: 17.0,
                                         //fontWeight: FontWeight.bold,
                                       ),
                                     )
                                   ],
                                 ),
                               ],
                             ),
                           )
                         ),
                       ),
                       SizedBox(
                         height: 20,
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text(
                               "Previous Matches",
                               style: TextStyle(
                                   color: Colors.black,
                                   fontSize: 17.0,
                                   fontWeight: FontWeight.bold
                               ),
                             ),
                             Text(
                               "View All",
                               style: TextStyle(
                                 //color: Colors.black,
                                 fontSize: 17.0,
                                 //fontWeight: FontWeight.bold
                               ),
                             )
                           ],
                         ),
                       ),
                       SizedBox(
                         height: 5,
                       ),
                       ListView.builder(
                           physics: ClampingScrollPhysics(),
                           shrinkWrap: true,
                           itemCount: 5,
                           itemBuilder: (context, index){
                             return Column(
                               children: [
                                 InkWell(
                                   child: Padding(
                                     padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                                     child: Container(
                                         width: width * 0.95,
                                         decoration: BoxDecoration(
                                           color: Colors.white,
                                           borderRadius: BorderRadius.circular(8.0),
                                           boxShadow: <BoxShadow>[
                                             BoxShadow(
                                               color: Colors.grey.shade300,
                                               blurRadius: 8,
                                             ),
                                           ],
                                         ),
                                         child: Padding(
                                           padding: const EdgeInsets.only(left: 5.0 , right: 5.0 ,top: 10.0, bottom: 10.0),
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                     "Fuchse Berlin",
                                                     style: TextStyle(
                                                       color: Colors.black,
                                                       fontSize: 17.0,
                                                       //fontWeight: FontWeight.bold,
                                                     ),
                                                   )
                                                 ],
                                               ),
                                               Column(
                                                 children: [
                                                   Container(
                                                     width: 140,
                                                     height: 50,
                                                     decoration: BoxDecoration(
                                                         color: Color(0xFFFB9595),
                                                         borderRadius: BorderRadius.circular(17.0)
                                                     ),
                                                     child: Padding(
                                                       padding: const EdgeInsets.only(left:8.0, right: 8.0),
                                                       child: Row(
                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                         children: [
                                                           Text(
                                                             "See Results",
                                                             style: TextStyle(
                                                                 color: Colors.white,
                                                                 fontSize: 16.0,
                                                                 fontWeight: FontWeight.bold
                                                             ),
                                                           ),
                                                           Icon(
                                                             Icons.arrow_forward_ios_rounded,
                                                             color: Colors.white,
                                                             size: 18.0,
                                                           )
                                                         ],
                                                       ),
                                                     ),
                                                   ),
                                                   SizedBox(
                                                     height: 5,
                                                   ),
                                                   Text(
                                                     "2 : 3",
                                                     style: TextStyle(
                                                         color: Colors.black,
                                                         fontSize: 22.0,
                                                         fontWeight: FontWeight.bold
                                                     ),
                                                   )
                                                 ],
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
                                                     "Hamburg",
                                                     style: TextStyle(
                                                       color: Colors.black,
                                                       fontSize: 17.0,
                                                       //fontWeight: FontWeight.bold,
                                                     ),
                                                   )
                                                 ],
                                               ),
                                             ],
                                           ),
                                         )
                                     ),
                                   ),
                                   onTap: (){
                                     Navigator.of(context).push(MaterialPageRoute(
                                         builder: (context) => ResultPredictionPage()));
                                   },
                                 ),
                                 SizedBox(
                                   height: 5,
                                 ),
                               ],
                             );
                           }
                       ),
                     ],
                   ),
                 ),
               ),
              )
          );
        }
    );
  }
}