import 'package:flutter/material.dart';
import 'package:mine_plod/demo/main_page.dart';




void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MinePlod',
      theme: new ThemeData(
        primaryColor:  const Color(0xFF02BB9F),
        primaryColorDark: const Color(0xFF167F67),
        accentColor: const Color(0xFFFFAD32),
      ),
      home: MainPage(),
    );
  }
}