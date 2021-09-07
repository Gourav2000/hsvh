import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hsvh/BasicWidgets.dart';
import 'package:hsvh/Screen/ZeroPage.dart';
import 'package:hsvh/auth/AuthServices.dart';
import 'package:hsvh/auth/LoginPage.dart';
import 'package:hsvh/controllers/Home/HomePageController.dart';
import 'package:http/http.dart';

import 'OtpScreen.dart';

class RegisterPage extends StatefulWidget {
  final phnNumber, username, email, countryCode, countryDialCode;
  RegisterPage(
      {this.phnNumber,
      this.email,
      this.username,
      this.countryCode,
      this.countryDialCode});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool obSecurePassword = true;
  bool obSecurePassword2 = true;
  //TextEditingController phno=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String username = '', email = '';
  bool gotEmail = false;
  String countryCode = 'IN', countryDialCode = '+91';

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      countryCode = widget.countryCode ?? 'IN';
      countryDialCode = widget.countryDialCode ?? '+91';
      gotEmail = widget.email != null;
      //phno.text=widget.phnNumber??'';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<HomePageController>(
      builder: (controller) {
        return Scaffold(
          //resizeToAvoidBottomInset: false,
          body: Container(
            color: Colors.white,
            height: height,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.1,
                    ),
                    SizedBox(
                        //height: height*0.2,
                        child: Image.asset(
                      'assets/clogo.png',
                      height: height * 0.2,
                    )),
                    SizedBox(
                        child: Text(
                      'Register With Us',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: height * 0.03),
                    )),
                    SizedBox(
                        child: Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.015, bottom: height * 0.015),
                      child: Text(
                        'Sign up Here',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    )),
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.07,
                            right: width * 0.07,
                            bottom: height * 0.015),
                        child: TextFormField(
                          initialValue: widget.username ?? '',
                          readOnly: widget.username != null ? true : false,
                          validator: (val) {
                            if (val!.length != 0) return null;
                            return 'enter valid username';
                          },
                          onSaved: (val) {
                            setState(() {
                              username = val!;
                            });
                          },
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.person),
                            suffix: widget.username != null
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.blue,
                                  )
                                : null,
                            labelText: 'Username',
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.07,
                            right: width * 0.07,
                            bottom: height * 0.015),
                        child: TextFormField(
                          initialValue: widget.email ?? '',
                          readOnly: widget.email != null ? true : false,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                          onSaved: (val) {
                            setState(() {
                              email = val!;
                            });
                          },
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.email),
                            suffix: gotEmail != false
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.blue,
                                  )
                                : InkWell(
                                    onTap: () async {
                                      try {
                                        await AuthServices.instance
                                            .updateEmail(email: email);
                                        await AuthServices.instance
                                            .sendEmailVerification();
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (ctx) => AlertDialog(
                                            title: Text("Verify Email"),
                                            content: Text(
                                                "A Verrification Email Has been Sent to your email, you need to verrify your email before proceeding"),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () async {
                                                  await FirebaseAuth
                                                      .instance.currentUser!
                                                      .reload();
                                                  if (FirebaseAuth
                                                          .instance
                                                          .currentUser!
                                                          .emailVerified ==
                                                      true) {
                                                    gotEmail = true;
                                                    Navigator.of(ctx).pop();
                                                  } else {
                                                    showError(
                                                        'Please verrify ur email in order to proceed',
                                                        context);
                                                  }
                                                },
                                                child: Text("I have verified"),
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  try {
                                                    await AuthServices.instance
                                                        .sendEmailVerification();
                                                  } catch (e) {
                                                    showError('${e.toString()}',
                                                        context);
                                                  }
                                                },
                                                child: Text("Resend Email"),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(ctx).pop();
                                                },
                                                child: Text("Cancel"),
                                              ),
                                            ],
                                          ),
                                        );
                                      } catch (e) {
                                        if (email.length != 0)
                                          showError(
                                              'User Already registered with this email',
                                              context);
                                        else
                                          showError(
                                              'Enter Valid Email', context);
                                      }
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            'Verify',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )),
                                  ),
                            labelText: 'Enter your email',
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                        ),
                      ),
                    ),
                    widget.phnNumber != null
                        ? SizedBox(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.07,
                                  right: width * 0.07,
                                  bottom: height * 0.015),
                              child: TextFormField(
                                initialValue: widget.phnNumber ?? '',
                                readOnly:
                                    widget.phnNumber != null ? true : false,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.phone),
                                  contentPadding: EdgeInsets.all(5),
                                  prefix: CountryCodePicker(
                                    onChanged: (code) {
                                      setState(() {
                                        countryCode = code.code!;
                                        countryDialCode = code.dialCode!;
                                      });
                                    },
                                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                    initialSelection: countryDialCode,
                                    enabled:
                                        widget.phnNumber != null ? false : true,
                                    padding: EdgeInsets.zero,
                                    favorite: ['+49', '+91'],
                                    // optional. Shows only country name and flag
                                    showCountryOnly: false,
                                    // optional. Shows only country name and flag when popup is closed.
                                    showOnlyCountryWhenClosed: false,
                                    showFlag: true,
                                    flagWidth: width * 0.05,
                                    // optional. aligns the flag and the Text left
                                    alignLeft: false,
                                  ),
                                  suffix: widget.phnNumber != null
                                      ? Icon(
                                          Icons.check_circle,
                                          color: Colors.blue,
                                        )
                                      : null,
                                  //     InkWell(
                                  //       onTap: ()async{
                                  //         // FirebaseAuth.instance.
                                  //         //   await AuthServices.instance.phoneLogin(phno.text,successFn: (){
                                  //         //
                                  //         //   });
                                  //        },
                                  //   child: Container(
                                  //       decoration: BoxDecoration(
                                  //         color: Colors.blue,
                                  //         borderRadius: BorderRadius.all(Radius.circular(20)),
                                  //       ),
                                  //       child: Padding(
                                  //         padding: const EdgeInsets.all(5),
                                  //         child: Text('verify',style: TextStyle(color: Colors.white),),
                                  //       )),
                                  // ),
                                  labelText: 'Phone Number',
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                    widget.phnNumber != null
                        ? SizedBox(
                            height: height * 0.05,
                          )
                        : SizedBox(),
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.07, right: width * 0.07),
                        child: InkWell(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                              await AuthServices.instance
                                  .updateName(name: username);
                              if (gotEmail == true)
                              // FirebaseAuth.instance.currentUser.uid;
                              {
                                final url = Uri.parse(
                                    "https://hsvh-backend.herokuapp.com/api/auth/registerUser");
                                final response = await post(url, body: {
                                  "userID":
                                      FirebaseAuth.instance.currentUser!.uid,
                                });
                                if (response.statusCode == 201) {
                                  print(FirebaseAuth.instance.currentUser!.uid);
                                  await controller.userIdSave(
                                      FirebaseAuth.instance.currentUser!.uid);
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ZeroPage(
                                                selectedIndex: 0,
                                              )));
                                } else {}
                              } else
                                showError('Verify your Email before proceeding',
                                    context);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red[900],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            height: height * 0.07,
                            width: width * 0.86,
                            child: Center(
                                child: Text(
                              'Sign up',
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   child: Padding(
                    //     padding: EdgeInsets.only(left: width*0.07,right: width *0.07,top: height*0.025,bottom:height*0.025 ),
                    //     child: Row(
                    //         children: <Widget>[
                    //           Expanded(
                    //               child: Divider(color: Colors.grey,)
                    //           ),
                    //
                    //           Text("          Or Continue With          ",style: TextStyle(color: Colors.grey),),
                    //
                    //           Expanded(
                    //               child: Divider(color: Colors.grey,)
                    //           ),
                    //         ]
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Padding(
                    //           padding: EdgeInsets.only(left: width*0.07),
                    //           child: Container(
                    //             decoration: BoxDecoration(
                    //                 color: Colors.red,
                    //                 borderRadius: BorderRadius.all(Radius.circular(10))
                    //             ),
                    //             height: height*0.055,
                    //             width: width*0.4,
                    //
                    //             child: Row(
                    //               children: [
                    //                 Spacer(),
                    //                 ImageIcon(AssetImage('assets/icons/Google.png'),color: Colors.white,),
                    //                 Text('Google',style: TextStyle(color: Colors.white),),
                    //                 Spacer(),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //
                    //         Padding(
                    //           padding: EdgeInsets.only(right: width *0.07),
                    //           child: Container(
                    //             height: height*0.055,
                    //             decoration: BoxDecoration(
                    //                 color: Colors.blue,
                    //                 borderRadius: BorderRadius.all(Radius.circular(10))
                    //             ),
                    //             width: width*0.4,
                    //             child: Row(
                    //               children: [
                    //                 Spacer(),
                    //                 ImageIcon(AssetImage('assets/icons/facebook.png'),color: Colors.white,),
                    //                 Text('Facebook',style: TextStyle(color: Colors.white),),
                    //                 Spacer(),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     )),
                    // SizedBox(child: Padding(
                    //   padding:EdgeInsets.only(top: height*0.05),
                    //   child: Row(
                    //     children: [
                    //       Spacer(),
                    //       Text("Already Have an Account?"),
                    //       InkWell(
                    //         onTap: (){
                    //           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    //         },
                    //           child: Text("Sign in",style: TextStyle(color: Colors.blue),)),
                    //       Spacer(),
                    //     ],
                    //   ),
                    // ))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
