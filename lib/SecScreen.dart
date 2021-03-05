import 'package:flutter/material.dart';


class SecondScreen extends StatelessWidget {
  SecondScreen({this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$title"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context,true);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}