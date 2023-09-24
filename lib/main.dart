import 'package:flutter/material.dart';
import 'package:food_prime_app/screens/onboarding/onboarding_screen.dart';
import 'package:food_prime_app/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primarySwatch = MaterialColor(
      0xFFED6E1B,
      <int, Color>{
        50: Color(0xFFED6E1B),
        100: Color(0xFFED6E1B),
        200: Color(0xFFED6E1B),
        300: Color(0xFFED6E1B),
        400: Color(0xFFED6E1B),
        500: Color(0xFFED6E1B),
        600: Color(0xFFED6E1B),
        700: Color(0xFFED6E1B),
        800: Color(0xFFED6E1B),
        900: Color(0xFFED6E1B),
      },
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Food Prime",
      theme: ThemeData(
        primarySwatch: primarySwatch,
      ),
      home: const SplashScreen(child: OnBoardingScreen())
    );
  }
}
