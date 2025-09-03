import 'package:flutter/material.dart';
class Mysample extends StatelessWidget{
  Mysample  ({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Settings',style: TextStyle(fontSize: 20),),
        centerTitle: true,
        
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.network_cell),
            title: Text('Mobile Network'),
            subtitle: Text('Manage network settings'),
            onTap: (){},
          ),Divider(),
           ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            subtitle: Text('Change app language'),
            onTap: (){},
          ),Divider(),
           ListTile(
            leading: Icon(Icons.palette),
            title: Text('Theme'),
            subtitle: Text('Choose light or dark theme'),
            onTap: (){},
          ),Divider(),
          ListTile(
            leading: Icon(Icons.volume_up),
            title: Text('Sounds & Vibration'),
            subtitle: Text('Adjust sound and vibration settings'),
            onTap: (){},
          ),
          Divider(),
           ListTile(
            leading: Icon(Icons.settings),
            title: Text('More settings'),
            subtitle: Text('Additional settings options'),
            onTap: (){},
          ),Divider(),


          
        ],
      ),
    );
  }
}