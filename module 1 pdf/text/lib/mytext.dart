import 'package:flutter/material.dart';
class text extends StatefulWidget{
  text({super.key});
  @override
  State<StatefulWidget> createState() =>MyText();
}
class MyText extends State<text>{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
     appBar: AppBar(
      backgroundColor: Colors.greenAccent,
      title: Text(
        "Whatsap",
        style: TextStyle(color: Colors.white),
        
        ),
        centerTitle: true,
     
     ),
     endDrawer: Drawer(
      child: Padding(padding: EdgeInsets.all(8),
      child: ListView(
        children:<Widget> [
          DrawerHeader(decoration: BoxDecoration(
            color: Colors.black,
          ),child: Column(
            children: [Container(
              child: Column(
                children: [
                  CircleAvatar(radius: 30,child: Text('R'),
                  ),
                  Text('Riyana'),
                ],
              ),
            )],
          ),
          ),
          ListTile(leading: Icon(Icons.home),
          title: Text('Home'),),
          ListTile(leading: Icon(Icons.settings),
          title: Text('Settings'),)
        ],
      ),),
     ),
     body: Center(
      child: Container(
        color: Colors.green,
        width: 150,
        height: 150,
      ),
     ),
    );
  }
}