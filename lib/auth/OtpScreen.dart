import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hsvh/BasicWidgets.dart';
import 'package:hsvh/Screen/ZeroPage.dart';
import 'package:hsvh/Splash/SplashAfterRegister.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hsvh/auth/AuthServices.dart';
import 'package:hsvh/auth/RegisterPage.dart';
import 'package:phone_number/phone_number.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  final phnNumber, countryCode, countryDialCode;
  OtpScreen({this.phnNumber, this.countryDialCode, this.countryCode});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios))
                ],
              ),
              SizedBox(
                  //height: height*0.2,
                  child: Image.asset(
                'assets/clogo.png',
                height: height * 0.2,
              )),
              SizedBox(
                height: height * 0.111,
              ),
              Text(
                'Enter Your OTP',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: height * 0.03),
              ),
              Text(
                'Enter the OTP sent to ${widget.countryDialCode} ${widget.phnNumber}',
                style: TextStyle(
                  color: Colors.grey.shade400,
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                child: PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: height * 0.06,
                      fieldWidth: width * 0.125,
                      activeFillColor: Colors.white,
                      inactiveColor: Colors.grey.shade300,
                      inactiveFillColor: Colors.white,
                      activeColor: Colors.blue,
                      selectedColor: Colors.blue,
                      selectedFillColor: Colors.white),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.white,
                  enableActiveFill: true,
                  errorAnimationController: errorController,
                  controller: textEditingController,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {},
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return false;
                  },
                  appContext: context,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: width * 0.05),
                child: Row(
                  children: [
                    Spacer(),
                    Text(
                      'Did not Recieve Code ?',
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              InkWell(
                onTap: () async {
                  if (textEditingController.text.length != 6)
                    errorController.add(ErrorAnimationType.shake);
                  else {
                    final res = await AuthServices.instance.verifyOtp(
                        widget.phnNumber, textEditingController.text);
                    if (res == 'new User') {
                      print('new User');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage(
                                    phnNumber: widget.phnNumber,
                                    countryDialCode: widget.countryDialCode,
                                    countryCode: widget.countryDialCode,
                                  )));
                    } else if (res == 'old User') {
                      print('old User');
                      if (FirebaseAuth.instance.currentUser!.displayName !=
                              '' &&
                          FirebaseAuth.instance.currentUser!.displayName !=
                              null)
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ZeroPage(
                                      selectedIndex: 0,
                                    )));
                      else {
                        PhoneNumber phoneNumber = await PhoneNumberUtil().parse(
                            FirebaseAuth.instance.currentUser!.phoneNumber
                                .toString());
                        print(
                            'zz= ${FirebaseAuth.instance.currentUser!.phoneNumber.toString()}');
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage(
                                      email: FirebaseAuth
                                          .instance.currentUser!.email,
                                      phnNumber: phoneNumber.nationalNumber,
                                      countryDialCode:
                                          '+${phoneNumber.countryCode}',
                                    )));
                      }
                    } else {
                      errorController.add(ErrorAnimationType.shake);
                      showError('Wrong otp provided', context);
                    }
                  }
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashAfterRegister()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red[900],
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  height: height * 0.07,
                  width: width * 0.86,
                  child: Center(
                      child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
