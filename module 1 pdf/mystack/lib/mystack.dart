import 'package:flutter/material.dart';

class Mystack extends StatelessWidget{
  Mystack({super.key});

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
        child: 
        
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
            Container(
              width: 150,
              height: 150,
              color: Colors.green,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}