import 'package:flutter/material.dart';
class homestate extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>home();
}
  class home extends State<homestate>{
   String? name;
    @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(onChanged: (value) {
                setState(() {
                  name=value;
                });
              },
                decoration: InputDecoration(labelText: 'Enter name',border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
                
              ),
            ),ElevatedButton(onPressed: (){
             Navigator.pushNamed(context, '/pro',arguments: name);
            }, style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 215, 198, 145)),child: Text('Submit',style: TextStyle(color: Colors.black,fontSize: 12),))
          ],
        ),
      ),
    );
  }
}

    class profile1 extends StatelessWidget{
 
    @override
  Widget build(BuildContext context) {
  final title = ModalRoute.of(context)?.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber,
        title: Text(title??'name'),),
    );
  }
  }

 