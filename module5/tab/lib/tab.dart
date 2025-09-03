import 'package:flutter/material.dart';

class tab1 extends StatelessWidget{
  tab1({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  DefaultTabController(length: 3, child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        bottom: TabBar(tabs: [
          Tab(icon: Icon(Icons.chat),text: 'Chat',),
          
          Tab(icon: Icon(Icons.call),text: 'Call',),
          Tab(icon: Icon(Icons.settings),text: 'Settings',),
        ]
        ),
      ),
     body: TabBarView(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 300,),
          Text('chat'),
        ],
      ),
      Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 300,),
          Text('Call'),
        ],
      ),
      Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 300,),
          Text('Settings'),
        ],
      ),
     ]),
      
    ));
  }
}