import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterloginui/calendar/event/eventProvider.dart';
//import 'package:flutterloginui/loginAndSignIn/loginAndSignin.dart';
//import 'package:flutterloginui/calendar/calendar.dart';
import 'package:flutterloginui/introScreen/screens/onboarding_screen.dart';
import 'package:flutterloginui/loginAndSignIn/loginAndSignin.dart';
import 'package:provider/provider.dart';


main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => EventProvider(),
    child: MaterialApp(
      theme: ThemeData(
        fontFamily: "Nunito",
        primaryColor: Colors.white,
        accentColor: Color(0xFFF2B501),
      ),
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    )
  );
  }








