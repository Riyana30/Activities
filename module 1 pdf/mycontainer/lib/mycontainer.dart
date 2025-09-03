import 'package:flutter/material.dart';
class Mycontainer extends StatelessWidget {
  Mycontainer({super.key});
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
    body: Container(
      width: 100,
      height: 100,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.yellow,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: Text('HELLO')),
    ),
    );
  }
}