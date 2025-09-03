import 'package:flutter/material.dart';

class list1 extends StatelessWidget{
  list1({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              
            },
          ),
          Divider(),
          ListTile(
            leading:Icon(Icons.settings) ,
            title: Text('settings'),
            onTap: () {
              
            },
          ),Divider(),
           ListTile(
            leading:Icon(Icons.language) ,
            title: Text('Languages'),
            onTap: () {
              
            },
          ),Divider(),
        ],
      ),
    );
  }
}