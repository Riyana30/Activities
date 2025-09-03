import 'package:flutter/material.dart';
class MyText extends StatelessWidget {
  MyText({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
     appBar: AppBar(
      backgroundColor: Colors.blue,
      title: Text(
        "AITRICH",
        style: TextStyle(color: Colors.white),
        
        ),
        centerTitle: true,
     
     ),
     body: Center(
      child: Container(
        color: Colors.green,
        width: 150,
        height: 150,
      ),
     ),
    );
  }
}