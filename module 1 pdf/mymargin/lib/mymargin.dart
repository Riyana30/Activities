import 'package:flutter/material.dart';
class Mymargin extends StatelessWidget{
  Mymargin({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Colors.amber,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(5),
        child: Container(
          padding: EdgeInsets.all(5),
          color: Colors.blue,
          child: Text('Hello'),
        ),
        ),
    );
  }
}