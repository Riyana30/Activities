import 'package:flutter/material.dart';

class Mycard extends StatelessWidget{
  Mycard({super.key});

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
        child:
        
         Card(
          color: Colors.red,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),

          ),
          child: Padding(padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Title',
                style: TextStyle(fontSize: 24,color: Colors.white),
                ),
                SizedBox(height:10),
                Text('This is some example content inside a card',
                style: TextStyle(color: Colors.white),)
            ],
          ),),
        ),

        
      ),
    );
  }
}