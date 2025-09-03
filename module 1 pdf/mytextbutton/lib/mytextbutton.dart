import 'package:flutter/material.dart';

class Mytextbutton extends StatelessWidget{
  Mytextbutton({super.key});

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
        child: TextButton(onPressed: (){
          print('Textbutton pressed');
        },
         child: Text('Click me'),
         ),
      ),
    );
  }
}