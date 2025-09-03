import 'package:flutter/material.dart';
class Mylisttile extends StatelessWidget{
  Mylisttile({super.key});

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
      body:
      
       ListView(
        children: [
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            subtitle: Text('Go to home screen'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print('Home tapped');
            },
          ),Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            subtitle: Text('App Settings'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print('Settings tappped');
            },
          ),Divider()
        ],
      ),



    );
  }
}