import 'package:flutter/material.dart';
class Myfloating extends StatelessWidget{
  Myfloating({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "AITRICH",
          style: TextStyle(color: Colors.black),),
          centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        
      },
      backgroundColor: Colors.red,
      child: Icon(Icons.add,
      color: Colors.white,),),

      
    );
  }
}