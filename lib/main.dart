// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hsvh/Screen/Home/HomePage.dart';
import 'package:hsvh/Splash/SplashScreen.dart';
import 'package:hsvh/controllers/Business%20Network%20controller/BusinessNetworkController.dart';
import 'package:phone_number/phone_number.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => BusinessProvider()),
        ],
        child: MaterialApp(
          title: 'Great Place',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            accentColor: Colors.amber,
          ),
          home: SplaScreen(
            forwardType: forwardType,
            user: user,
          ),
          debugShowCheckedModeBanner: false,
        ));
  }
}
