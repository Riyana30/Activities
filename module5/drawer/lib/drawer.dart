import 'package:flutter/material.dart';
class drawer extends StatelessWidget{
  drawer({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      
      appBar: AppBar(
        
      ), drawer: Drawer(child: ListView(
        children: <Widget>[
          DrawerHeader(decoration: BoxDecoration(color: Colors.amber),child: Column(
            children: [
              Text('Drawerheader'),
            ],
          )),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),Divider(),
        ],
      ),),
      
      
      
      
    
    );
  }
}