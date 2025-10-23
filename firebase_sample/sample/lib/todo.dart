import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final DatabaseReference _tasksRef =
      FirebaseDatabase.instance.ref().child('tasks');

  List<Task> _tasks = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Listen for real-time changes
    _tasksRef.onChildAdded.listen((event) {
      final task = Task(
        id: event.snapshot.key!,
        text: event.snapshot.child('task').value as String,
      );
      setState(() => _tasks.add(task));
    });

    _tasksRef.onChildChanged.listen((event) {
      final index = _tasks.indexWhere((t) => t.id == event.snapshot.key);
      if (index != -1) {
        setState(() {
          _tasks[index].text = event.snapshot.child('task').value as String;
        });
      }
    });

    _tasksRef.onChildRemoved.listen((event) {
      setState(() {
        _tasks.removeWhere((t) => t.id == event.snapshot.key);
      });
    });
  }

  void _addTask(String text) {
    if (text.isEmpty) return;
    final newTaskRef = _tasksRef.push();
    newTaskRef.set({'task': text});
    _controller.clear();
  }

  void _editTask(Task task, String newText) {
    _tasksRef.child(task.id).update({'task': newText});
  }

  void _deleteTask(Task task) {
    _tasksRef.child(task.id).remove();
  }

  void _showAddDialog() {
    _controller.clear();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Add Task'),
        content: TextField(controller: _controller),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text('Cancel')),
          ElevatedButton(
              onPressed: () {
                _addTask(_controller.text);
                Navigator.pop(context);
              },
              child: Text('Add'))
        ],
      ),
    );
  }

  void _showEditDialog(Task task) {
    _controller.text = task.text;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Edit Task'),
        content: TextField(controller: _controller),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text('Cancel')),
          ElevatedButton(
              onPressed: () {
                _editTask(task, _controller.text);
                Navigator.pop(context);
              },
              child: Text('Save'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (_, index) {
          final task = _tasks[index];
          return ListTile(
            title: Text(task.text),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    icon: Icon(Icons.edit, color: Colors.orange),
                    onPressed: () => _showEditDialog(task)),
                IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteTask(task)),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
class Task {
  String id;
  String text;

  Task({required this.id, required this.text});
}
