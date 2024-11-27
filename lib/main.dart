import 'package:flutter/material.dart';
import 'package:podcast_app/screens/home_screen.dart';
import 'package:podcast_app/screens/login_screen.dart';
import 'package:podcast_app/screens/profile.dart';
import 'package:podcast_app/screens/search.dart';
import 'package:podcast_app/screens/playing_screen.dart';
import 'package:podcast_app/screens/signup_screen.dart';
import 'package:podcast_app/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Podcast',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => splash_screen(),
        LoginScreen.ScreenRoute: (ctx) => LoginScreen(),
        SignupScreen.ScreenRoute: (ctx) => SignupScreen(),
        PlayingScreen.ScreenRoute: (ctx) => PlayingScreen(),
        SearchPage.ScreenRoute: (ctx) => SearchPage(),
        ProfileScreen.ScreenRoute: (ctx) => ProfileScreen(),
        HomeScreen.ScreenRoute: (ctx) => HomeScreen()
      },
    );
  }
}
