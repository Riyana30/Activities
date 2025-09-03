import 'package:flutter/material.dart';

class Mycircletext extends StatelessWidget{
  Mycircletext({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Aitrich",
          style: TextStyle(color: Colors.black),),
          centerTitle: true,
      ),
      body: Center(
        child: CircleAvatar(
          radius: 100,
          backgroundColor: Colors.blue,
          child: Text(
            'A',
            style: TextStyle(color: Colors.white,fontSize: 50),
            ),
        ),
      ),
    );
  }
}