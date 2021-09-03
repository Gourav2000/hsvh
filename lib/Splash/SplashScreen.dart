import 'package:flutter/material.dart';
import 'package:hsvh/Screen/ZeroPage.dart';
import 'package:hsvh/auth/LoginPage.dart';
import 'package:hsvh/auth/RegisterPage.dart';
import 'package:phone_number/phone_number.dart';
import 'package:splashscreen/splashscreen.dart';

class SplaScreen extends StatefulWidget {
  final forwardType,user;
  SplaScreen({this.forwardType,this.user});

  @override
  _SplaScreenState createState() => _SplaScreenState();
}

class _SplaScreenState extends State<SplaScreen> {
  String phNo='',dialCode='';
  Future<void> getPhoneNo()async {
    if(widget.user.phoneNumber!=null){
    PhoneNumber phoneNumber = await PhoneNumberUtil().parse(widget.user.phoneNumber);
    setState(() {
      phNo=phoneNumber.nationalNumber;
      dialCode=phoneNumber.countryCode;
    });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    print(widget.user);
    widget.user!=null?getPhoneNo():null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SplashScreen(
            seconds: 5,
            navigateAfterSeconds: widget.forwardType=='login'?LoginPage():widget.forwardType=='register'?RegisterPage(email: widget.user.email,username: widget.user.displayName,phnNumber: phNo,countryDialCode: '+$dialCode',):ZeroPage(selectedIndex: 0,),
            //title: new Text('Welcome to HSVH',style: TextStyle(color: Colors.white,fontSize: 40),),
           //image: new Image.asset('assets/screenshot.jpeg'),
            //backgroundColor: Colors.transparent,
            imageBackground: AssetImage('assets/Splashscreen.png'),
            styleTextUnderTheLoader: new TextStyle(),
            //photoSize: MediaQuery.of(context).size.width,
            loaderColor: Colors.transparent
        ),
      ),
    );;
  }
}
