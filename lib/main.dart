// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hsvh/Screen/Home/HomePage.dart';
import 'package:hsvh/Splash/SplashScreen.dart';
import 'package:phone_number/phone_number.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  String forwardType;
  //await FirebaseAuth.instance.signOut();
  FirebaseAuth.instance.userChanges().listen((User user) async {
    if (user == null) {
      print('User is currently signed out!');
      runApp(MyApp(
        forwardType: 'login',
        user: user,
      ));
    } else {
      print(user.phoneNumber == null);
      print('User is signed in! ${user.phoneNumber}');
      // PhoneNumber phoneNumber = await PhoneNumberUtil().parse(user.phoneNumber);
      // print(phoneNumber.countryCode);

      if (user.displayName == null || user.emailVerified != true)
        runApp(MyApp(
          forwardType: 'register',
          user: user,
        ));
      else
        runApp(MyApp(
          forwardType: 'home',
          user: user,
        ));
    }
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final forwardType, user;
  MyApp({this.forwardType, this.user});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: HomePage(),
      home: SplaScreen(
        forwardType: forwardType,
        user: user,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
