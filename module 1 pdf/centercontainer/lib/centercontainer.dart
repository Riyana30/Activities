import 'package:flutter/material.dart';
class Centercontainer extends StatelessWidget {
  Centercontainer({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "AITRICH",
          style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,

      ),
      body: Center(
        child: Container(
          color: Colors.yellow,
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}