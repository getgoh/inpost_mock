import 'package:flutter/material.dart';
import 'package:inpost_mock/screens/home_screen.dart';
import 'package:inpost_mock/screens/map_screen.dart';
import 'package:inpost_mock/screens/onboarding_screen.dart';

import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.white,
        textTheme: TextTheme(
          body1: kAppTextStyle,
          body2: kAppTextStyle,
          button: kAppTextStyle,
        ),
      ),
      initialRoute: OnboardingScreen.id,
      routes: {
        OnboardingScreen.id: (context) => OnboardingScreen(),
        MapScreen.id: (context) => MapScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
