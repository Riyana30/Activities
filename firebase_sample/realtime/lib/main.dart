

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:realtime/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp( MyApp());
}


  class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Contactscreen(),
    );
  }
}
class Contactscreen extends StatefulWidget {
  const Contactscreen({super.key});

  @override
  State<Contactscreen> createState() => _ContactscreenState();
}

class _ContactscreenState extends State<Contactscreen> {
  final TextEditingController _namecontroller=TextEditingController();
  final DatabaseReference _contactref =
    FirebaseDatabase.instance.ref().child('contacts');
  Future<void> _saveContact()async{
    String name=_namecontroller.text.trim();
    if(name.isNotEmpty){
      await _contactref.push().set(<String,String>{'name':name});
      _namecontroller.clear();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Contact Saved:$name')));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Svae Contact'),

      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _namecontroller,
            decoration: InputDecoration(labelText: 'Enter Conact Name'),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: _saveContact, child: Text('Save Contact')),
          SizedBox(height: 20,),
         Expanded(
  child: StreamBuilder<DatabaseEvent>(
    stream: _contactref.onValue,
    builder: (context, snapshot) {
      // 🔹 Show loading spinner while waiting for data
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      // 🔹 Show error message if something goes wrong
      if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      }

      // 🔹 Check if data is null or not available
      if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
        return const Center(child: Text('No Contacts Saved'));
      }

      // 🔹 Convert the snapshot value to Map
      final Map<dynamic, dynamic> contacts =
          snapshot.data!.snapshot.value as Map<dynamic, dynamic>;

      // 🔹 Convert map entries to a list
      final List<MapEntry<dynamic, dynamic>> contactList =
          contacts.entries.toList();

      // 🔹 Display the contact list
      return ListView.builder(
        itemCount: contactList.length,
        itemBuilder: (context, index) {
          final contact = contactList[index];

          return ListTile(
            title: Text(contact.value['name'] ?? 'No Name'),
            subtitle: Text(contact.value['phone'] ?? 'No Phone'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    // TODO: Add edit functionality
                  },
                  icon: const Icon(Icons.edit, color: Colors.blue),
                ),
                IconButton(
                  onPressed: () {
                    // TODO: Add delete functionality
                  },
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
          );
        },
      );
    },
  ),
)

        ],
      ),),
    );
  }
}