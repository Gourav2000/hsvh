import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:hsvh/BasicWidgets.dart';
import 'package:hsvh/Screen/ZeroPage.dart';
import 'package:phone_number/phone_number.dart';
import 'package:hsvh/auth/AuthServices.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:hsvh/auth/RegisterPage.dart';

import 'OtpScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obSecurePassword=true;
  bool RememberMe=true;
  bool loadingStatus=false;
  String countryCode='IN';
  String countryDialCode='+91';
  //final phnKey=GlobalKey<FormState>();
  TextEditingController phn=TextEditingController();
  bool isNumberValid=false;
  PhoneNumberUtil plugin = PhoneNumberUtil();

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: loadingStatus==true?progressIndicator():Container(
        color: Colors.white,
        height: height,
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: height*0.1,),
            SizedBox(
                //height: height*0.2,
                child: Image.asset('assets/clogo.png',height: height*0.2,)
            ),
            SizedBox(
                child: Text(
              'Welcome',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: height*0.03),
            )),
            SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(top: height*0.015,bottom: height*0.035),
                  child: Text(
              'Enter your Phone no. in to Continue',
              style: TextStyle(color: Colors.grey.shade400,),
            ),
                )),
            SizedBox(height: height*0.025,),
            SizedBox(
              child: Padding(
                padding:  EdgeInsets.only(left: width*0.07,right: width *0.07,bottom: height*0.015),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: phn,
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding:  EdgeInsets.only(top: 5.0),
                            child: Icon(Icons.phone),
                          ),
                          contentPadding: EdgeInsets.all(5),
                          prefix: CountryCodePicker(
                  onChanged: (code){
                    setState(() {
                      countryCode=code.code!;
                      countryDialCode=code.dialCode!;
                    });
                  },
                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                  initialSelection: 'IN',
                  padding: EdgeInsets.zero,
                  favorite: ['+49','+91'],
                  // optional. Shows only country name and flag
                  showCountryOnly: false,
                  // optional. Shows only country name and flag when popup is closed.
                  showOnlyCountryWhenClosed: false,
                  showFlag: true,
                  flagWidth: width*0.05,
                  // optional. aligns the flag and the Text left
                  alignLeft: false,
                ),
                          //prefixIcon: Icon(Icons.phone),
                          labelText: 'Phone Number',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                          focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),

                              borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: height*0.025,
            ),
            SizedBox(
              child: Padding(
                padding: EdgeInsets.only(left: width*0.07,right: width*0.07),
                child: InkWell(
                  onTap: ()async{

                    try{
                      if(await plugin.validate(phn.text, countryCode)==true){
                        try{
                          setState(() {
                            loadingStatus=true;
                          });
                          await AuthServices.instance.phoneLogin(countryDialCode+phn.text,successFn: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen(phnNumber:phn.text ,countryCode: countryCode,countryDialCode: countryDialCode,)));
                          },);

                        }catch(e){
                          setState(() {
                            loadingStatus=false;
                          });
                          showError(e.toString(),context);
                        }

                      }
                      else{
                        showError('Plz enter a valid mobile number', context);
                      }
                    }catch(e)
                    {
                      showError('Plz enter a valid mobile number', context);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red[900],
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    height: height*0.07,
                    width: width*0.86,

                    child: Center(child: Text('Continue',style: TextStyle(color: Colors.white),)),
                  ),
                ),
              ),
            ),
            SizedBox(height: height*0.05,),
            SizedBox(
              child: Padding(
                padding: EdgeInsets.only(left: width*0.07,right: width *0.07,top: height*0.025,bottom:height*0.025 ),
                child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Divider(color: Colors.grey.shade400,)
                      ),

                      Text("          Or Continue With          ",style: TextStyle(color: Colors.grey.shade400),),

                      Expanded(
                          child: Divider(color: Colors.grey.shade400,)
                      ),
                    ]
                ),
              ),
            ),
            SizedBox(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: ()async{
                        print('hello');
                        setState(() {
                          loadingStatus=true;
                        });
                        final res=await AuthServices.instance.googleLogin();
                        setState(() {
                          loadingStatus=false;
                        });
                        if(res!='failure')
                          {
                            if(res.isNewUser==true)
                              {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage(username: res.profile['name'],email: res.profile['email'])));
                              }
                            else{
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ZeroPage(selectedIndex: 0,)));
                            }
                          }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: width*0.07),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          height: height*0.055,
                          width: width*0.4,

                          child: Row(
                            children: [
                              Spacer(),
                              ImageIcon(AssetImage('assets/icons/Google.png'),color: Colors.white,),
                              Text('Google',style: TextStyle(color: Colors.white),),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: ()async{

                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: width *0.07),
                        child: Container(
                          height: height*0.055,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          width: width*0.4,
                          child: Row(
                            children: [
                              Spacer(),
                              ImageIcon(AssetImage('assets/icons/facebook.png'),color: Colors.white,),
                              Text('Facebook',style: TextStyle(color: Colors.white),),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
