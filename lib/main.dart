import 'package:flutter/material.dart';
import 'package:webviewDemo/Screens/Welcome/welcome_screen.dart';
import 'package:webviewDemo/constants.dart';
import 'package:webviewDemo/profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
