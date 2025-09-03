import 'package:flutter/material.dart';

class Myrow extends StatelessWidget{
  Myrow({super.key});

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
      body:Center(
       child:  
    Row(
        mainAxisAlignment:
         MainAxisAlignment.center,
        children: [
          Icon(Icons.facebook,size: 50.0),
          SizedBox(width: 20.0),
          Icon(Icons.phone,size: 50.0),
          SizedBox(width: 20.0),
          Icon(Icons.notifications,size: 50.0),
        ],
      ),
        ) 
    );
  }
}
