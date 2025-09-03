import 'package:flutter/material.dart';

class Mywhatsapp extends StatelessWidget {
  const Mywhatsapp({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            'Whatsapp',
            style: TextStyle(fontSize: 20),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.camera_alt)),
              Tab(text: 'CHATS'),
              Tab(text: 'STATUS'),
              Tab(text: 'CALLS'),
            ],
          ),
        ),

        endDrawer: SafeArea(
          child: Align(
            alignment: Alignment.topRight, 
            child: Material(
              elevation: 16,
              child: Container(decoration: BoxDecoration(color: const Color.fromARGB(255, 145, 209, 147),
              borderRadius: BorderRadius.circular(50),border:Border.symmetric()),
                width: MediaQuery.of(context).size.width * 0.7,
               
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    ListTile(title: Text('New Group'),),
                    Divider(),
                    ListTile(title: Text('Stared messages')),
                    Divider(),
                    ListTile(title: Text('Read All')),
                    Divider(),
                    ListTile(title: Text('Settings')),
                    Divider(),
                  ],
                ),
              ),
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          child: const Icon(Icons.message),
        ),

        body: TabBarView(
          children: [
            const Center(child: Icon(Icons.camera_alt, size: 200)),
            ListView(
              children: const [
                ListTile(
                  leading: Icon(Icons.circle, color: Colors.lightGreenAccent),
                  title: Text('Alice'),
                  subtitle: Text('Hey ,how are you'),
                  trailing: Text('10:45 AM'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.circle, color: Colors.lightGreenAccent),
                  title: Text('Bob'),
                  subtitle: Text("Let's meet tomorrow"),
                  trailing: Text('9:30 AM'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.circle, color: Colors.lightGreenAccent),
                  title: Text('Charlie'),
                  subtitle: Text('Got the files ?'),
                  trailing: Text('Yesterday'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.circle, color: Colors.lightGreenAccent),
                  title: Text('Diana'),
                  subtitle: Text('Can you call me ?'),
                  trailing: Text('2:15 PM'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.circle, color: Colors.lightGreenAccent),
                  title: Text('Eve'),
                  subtitle: Text("What's the update ?"),
                  trailing: Text('3 days ago'),
                ),
                Divider(),
              ],
            ),
            ListView(
              children: [Column(
                children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                     children: [
                       Stack(children: [CircleAvatar(radius: 40,child: Text('R',style: TextStyle(fontSize:30 ),),),
                       IconButton(onPressed: (){}, icon: Icon(Icons.add))],),
                       Column(mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Text('Add status',textAlign: TextAlign.left,),

                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 25),
                             child: Text('Disappear after 24 hour'),
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
                

                  
                ],
              )],
            ),
            const Center(child: Text('Calls Screen', style: TextStyle(fontSize: 25))),
          ],
        ),
      ),
    );
  }
}
