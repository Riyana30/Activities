import 'package:flutter/material.dart';

class prefsuf extends StatelessWidget{
  prefsuf({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Prefix and Suffix Icon',style: TextStyle(
          color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold
        ),),centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.mail),
              labelText: 'Enter Text',
              suffixIcon: Icon(Icons.remove_red_eye),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5)
              )
            ),
          ),
        ),
      ),
    );
  }
}