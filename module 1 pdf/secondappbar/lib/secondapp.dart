import 'package:flutter/material.dart';

class Secondapp extends StatelessWidget {
  Secondapp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.yellow,
        title: Text(
          "AITRICH",
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
        leading: Icon(Icons.settings),    //left
        actions: [
          Icon(Icons.search),
        ],

      ),
    );
  }
}