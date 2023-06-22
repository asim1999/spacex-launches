import 'package:flutter/material.dart';
import 'package:space_x_launches/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Disable debug banner
      debugShowCheckedModeBanner: false,
      title: 'Space X Launches',
      //Global theme
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
            elevation: 0,
            color: Colors.white,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(
              color: Colors.black,
            )),
        tabBarTheme: const TabBarTheme(
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          labelColor: Colors.black,
        ),
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}