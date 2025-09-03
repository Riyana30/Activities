import 'package:flutter/material.dart';
class Mywhatsapp extends StatelessWidget{
  Mywhatsapp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: Icon(Icons.arrow_back),
        title: Text(
          "Settings",
          
          style: TextStyle(color: Colors.black),),
          actions: [Icon(Icons.search)],
      ),
      body: Padding(
        
        padding: const EdgeInsets.all(8.0),
        child: ListView(
              children: [
                 Card(
                   child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.green,
                      child: Icon(Icons.person,color: Colors.white,size: 20,),
                    ),
                    title: Text('Riyana',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                    subtitle: Text('Busy',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                    trailing: Icon(Icons.add_a_photo),
                    
                                   ),
                 ),
                ListTile(
                  leading: Icon(Icons.key),
                  title: Text('Account'),
                  subtitle: Text('security notifications,change number'),
                  
                ),
                 ListTile(
                  leading: Icon(Icons.lock),
                  title: Text('Privacy'),
                  subtitle: Text('Block contacts,disappearing messages'),
                 ),
                  ListTile(
                  leading: Icon(Icons.person_2),
                  title: Text('Avatar'),
                  subtitle: Text('Create , edit , profile photo'),
                 ),
                 ListTile(
                  leading: Icon(Icons.list),
                  title: Text('Lists'),
                  subtitle: Text('Manage people and groups'),
                 ),
              ],
            ),
            
      ),
      

    );
  }
}
       