import 'package:flutter/material.dart';
import 'package:calendar_store/theme.dart';
import 'package:calendar_store/introScreen/screens/onboarding_screen.dart';
import 'package:provider/provider.dart';


void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
              create: (_) => ThemeNotifier(),
              child: Consumer<ThemeNotifier>(
                  builder: (context, ThemeNotifier notifier, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Team 7',
                  theme: notifier.isDarkTheme! ? dark : light,
                  home: OnboardingScreen(),
                );
              }),
            );
  }
}

