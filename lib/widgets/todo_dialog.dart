import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pertemuan6/services/firestore_services.dart';
import 'package:flutter/material.dart';


class TodoDialog extends StatefulWidget{
  final FirestoreServices firestoreServices;
  const TodoDialog({super.key, required this.firestoreServices});

  @override
  State<TodoDialog> createState() => _TodoDialogState();

}

class _TodoDialogState extends State<TodoDialog> {
  final TextEditingController _taskController = TextEditingController();

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Todo'),
      content: TextField(
        controller: _taskController,
        decoration: InputDecoration(hintText: 'Add new task'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: (){
            if(_taskController.text.trim().isNotEmpty){
              widget.firestoreServices.addTodo(_taskController.text);
              Navigator.pop(context);
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}