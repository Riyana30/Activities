import 'package:flutter/material.dart';
class Myimage extends StatelessWidget{
  Myimage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Dog",
          style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Image.asset('assets/dog.jpg')
          
          
        ),
      ),
      
      
    );
  }
}