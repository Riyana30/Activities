import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudfirestore/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return MaterialApp(home: contactscreen(),);
  }
}
class contactscreen extends StatefulWidget{
  @override
  _contactscreenstate createState() =>_contactscreenstate();
}
class _contactscreenstate extends State<contactscreen>{
  final TextEditingController _namecontroller=TextEditingController();
 final CollectionReference _contactRef=FirebaseFirestore.instance.collection('contacts');

 Future <void> _saveContact() async{
  String name=_namecontroller.text.trim();
  if(name.isNotEmpty){
    await _contactRef.add({'name':name});
    _namecontroller.clear();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Contact Saved:$name')));
  }
 }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.green,
      title: Text('Save Contact'),
    ),
    body: Padding(padding: EdgeInsets.all(16),
    child: Column(
      children: [
        TextField(
          controller: _namecontroller,
          decoration: InputDecoration(labelText: 'Enter Contact Name'),
        ),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: _saveContact, child: Text('Save Contact')),
        SizedBox(height: 20,),
        Expanded(child: StreamBuilder<QuerySnapshot>(stream: _contactRef.snapshots(),builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }if(!snapshot.hasData|| snapshot.data!.docs.isEmpty){
            return Center(child: Text('No Contacts Saved'),);
          }
          var contacts=snapshot.data!.docs;
          return ListView.builder(itemCount: contacts.length,itemBuilder: (context,index){
            var Contact=contacts[index];
            return ListTile(title: Text(Contact['name']),);
          });
        },))
      ],
    ),),
   );
  }
}
