import 'package:flutter/material.dart';

class Mytext extends StatelessWidget{
  Mytext({super.key});

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
        child: Padding(padding: EdgeInsets.all(10.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(),
          ),
          onChanged: (Text) {
            print('Name enterd:$Text');
          },
        ),),
      ),
    );
  }
}