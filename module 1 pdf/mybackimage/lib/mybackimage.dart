import 'package:flutter/material.dart';
class Mybgimage extends StatelessWidget{
  Mybgimage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Dogs",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: CircleAvatar(radius: 100,
        backgroundImage: AssetImage('assets/dog1.jpg'),
        ),
      ),
    );
  }
}