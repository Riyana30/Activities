import 'package:flutter/material.dart';

class Mygrid extends StatelessWidget{
  Mygrid({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Aitrich",
          style: TextStyle(color: Colors.black),),
          centerTitle: true,
      ),
      body: Center(
        child:
        
        
         GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,crossAxisSpacing: 8.0,mainAxisSpacing: 8.0,),
          itemCount: 16,
           itemBuilder: (context, index) {
             return Container(
              alignment: Alignment.center,
              color: Colors.blue,
              child: Text(
                '1',
                style: TextStyle(fontSize: 24,color: Colors.white),),
             );
           },),


           
      ),
    );
  }
}