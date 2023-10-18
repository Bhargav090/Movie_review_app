// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:moviereview/homepage.dart';
import 'package:flutter/services.dart';

void main() {
  //for the fullscreen of app.......................
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // for Android
    statusBarIconBrightness: Brightness.dark, // for iOS
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
