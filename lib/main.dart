import 'package:flutter/material.dart';
import 'package:wallpaper_app/Screens/Wallpaper_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Settify',
      theme: ThemeData.dark(),
      home: Main_Screen(),
    );
  }
}
