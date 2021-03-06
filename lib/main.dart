import 'package:flutter/material.dart';
import 'package:game15/pages/adaptive_page.dart';
import 'package:game15/pages/enter_page.dart';
import 'package:game15/pages/game_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: EnterPage(),
    );
  }
}
