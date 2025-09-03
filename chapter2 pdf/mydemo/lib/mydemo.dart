import 'package:flutter/material.dart';
class Mydemo extends StatelessWidget{
  Mydemo({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Prefix & Suffix',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        centerTitle: true,

      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              prefix: Icon(Icons.mail),
              hint: Text('Enter Text'),
              suffix: Icon(Icons.remove_red_eye),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              )
            ),
          ),
        ),
      ),
    );
  }
}