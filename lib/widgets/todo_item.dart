import 'package:flutter/material.dart';
import 'package:pertemuan6/models/todo.dart';
import 'package:pertemuan6/services/firestore_services.dart';

class TodoItem extends StatelessWidget{
  final Todo todo;
  final FirestoreServices firestoreServices;

  const TodoItem({
    super.key,
    required this.todo,
    required this.firestoreServices,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible( 
      key: Key(todo.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) => firestoreServices.deleteTodo(todo.id),
      child: CheckboxListTile(
      title: Text(
        todo.task,
        style: TextStyle(
          decoration: todo.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
          value: todo.isDone,
          onChanged: (_) => firestoreServices.updateTodoStatus(todo.id, todo.isDone),
    ),
    );
    
  }
}