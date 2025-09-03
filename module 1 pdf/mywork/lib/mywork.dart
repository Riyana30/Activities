import 'package:flutter/material.dart';
class Mywork extends StatelessWidget{
  Mywork({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(



      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Aitrich'),
        centerTitle: true,
      ),



      body:
       Center(
         child: Container(
          color: Colors.amber,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(5),
          child: Container(
            padding: EdgeInsets.all(5),
            color: Colors.red,
            child: Text('Hello'),
          ),
               ),
       ),
    );
  }
}