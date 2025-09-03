import 'package:flutter/material.dart';

class Myiconbutton extends StatelessWidget{
  Myiconbutton ({super.key});

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
        child: IconButton( icon: Icon(Icons.favorite),onPressed: (){
          print('Icon Button Pressed');
        },
        color: Colors.red,
        iconSize: 50.0,
        ),
      ),
    );
  }
}