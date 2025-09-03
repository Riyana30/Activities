import 'package:flutter/material.dart';

class myappbar extends StatelessWidget {
  const myappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(


      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Aitrich"),
        centerTitle: true,
      ),


      
    );
  }
}