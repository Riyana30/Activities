import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TOdoListScreen extends StatefulWidget {
  TOdoListScreen({super.key});

  @override
  State<TOdoListScreen> createState() => _todostate();
}

class _todostate extends State<TOdoListScreen> {
   List<String>_todolist=[];
  final TextEditingController _taskcontoller=TextEditingController();
  final DatabaseReference _databaseReference=FirebaseDatabase.instance.ref();
  @override
  void initState(){
    super.initState();
   _databaseReference.child('tasks').get().then((snapshot) {
    if(snapshot.exists){
      var tasks = snapshot.children.map((child){
        return Task(
          id: child.key!,
          text: child.child('task').value as String
        );
      }).toList();
      
      setState(() {
        _todolist = tasks.cast<String>();
      });
    }
  });
   _databaseReference.child('tasks').onChildAdded.listen((event){
    final task = Task(
      id: event.snapshot.key!,
      text: event.snapshot.child('task').value as String
    );
    if(!_todolist.any((t) => t.id == task.id)){
      setState(() {
        _todolist.add(task as String);
      });
    }
  });
}
 void _addTask(String text){
  final newRef = _databaseReference.child('tasks').push();
  newRef.set({'task': text}).then((_) {
    setState(() {
      _todolist.add(Task(id: newRef.key!, text: text) as String);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Task Saved')));
  }).catchError((error){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to save task')));
  });
}
 void _editTask(int index, String newText, String text){
  final task = _todolist[index];
  _databaseReference.child('tasks').child(task.id).update({'task': newText});
  setState(() {
    _todolist[index].text = newText;
  });
}
  void _deleteTask(int index, String taskid){
  final task = _todolist[index];
  _databaseReference.child('tasks').child(task.id).remove();
  setState(() {
    _todolist.removeAt(index);
  });
}
  void _showeditingtaskdialog(int index,String taskid){
    _taskcontoller.text=_todolist[index];
    showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text('Edit Task'),
      content: TextField(
        controller: _taskcontoller,
        decoration: InputDecoration(hintText: 'Edit your task'),
      ),
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text('Cancel')),
        ElevatedButton(onPressed: (){
          if(_taskcontoller.text.isNotEmpty){
            _editTask(index, taskid, _taskcontoller.text);
            Navigator.of(context).pop();
          }
        }, child: Text('Save'))
      ],
    ));

  }
void _showaddtaskdialog(){
  _taskcontoller.clear();
  showDialog(context: context, builder: (context)=>AlertDialog(
    title: Text('Add Task'),
    content: TextField(
      controller: _taskcontoller,
      decoration: InputDecoration(hintText: 'Enter your task'),
    ),
    actions: [
      TextButton(onPressed: (){
        Navigator.of(context).pop();
      }, child: Text('Cancel')),
      ElevatedButton(onPressed: (){
        if(_taskcontoller.text.isNotEmpty){
          _addTask(_taskcontoller.text);
          Navigator.of(context).pop();
        }
      }, child: Text('Add'))
    ],
  ));
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Todo List'),
        centerTitle: true,
      ),
      body: ListView.builder(itemCount: _todolist.length,itemBuilder: (context,index){
        String taskid=_todolist[
          index
        ];
        return ListTile(
          title: Text(_todolist[index]),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: ()=>_showeditingtaskdialog(index, taskid), icon: Icon(Icons.edit,color: Colors.orange,)),
              IconButton(onPressed: ()=>_deleteTask(index, taskid), icon: Icon(Icons.delete,color: Colors.red,))
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(onPressed: _showaddtaskdialog,backgroundColor: Colors.green,child: Icon(Icons.add),),
    );
  }
  
}

extension on String {
  get id => null;
  
  set text(String text) {}
}  
class Task {
  String id;
  String text;
  Task({required this.id, required this.text});
}
