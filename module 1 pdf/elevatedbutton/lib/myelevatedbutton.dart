import 'package:flutter/material.dart';

class Myelevatedbutton extends StatelessWidget{
  Myelevatedbutton({super.key});

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {
            print('button pressed');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(20),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
          ), child: Text('ElevatedButton',
          style: TextStyle(color: Colors.white),))
        ],
      ),
     ), 
    );
    
  }
 

}