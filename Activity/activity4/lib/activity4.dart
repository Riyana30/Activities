import 'package:flutter/material.dart';

class activity4 extends StatelessWidget{
  activity4({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Settings',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.network_cell),
                  title: Text('Mobile Network'),
                  subtitle: Text('Manage network settings'),
                ),Divider(),
                 ListTile(
                  leading: Icon(Icons.language),
                  title: Text('Language'),
                  subtitle: Text('Change app language'),
                ),Divider(),
                 ListTile(
                  leading: Icon(Icons.color_lens),
                  title: Text('Theme'),
                  subtitle: Text('Choose light or dark theme'),
                ),Divider(),
                 ListTile(
                  leading: Icon(Icons.volume_up),
                  title: Text('Sounds & Vibration'),
                  subtitle: Text('Adjust sound and vibration settings'),
                ),Divider(),
                 ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('More Settings'),
                  subtitle: Text('Additional settings options'),
                ),Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}