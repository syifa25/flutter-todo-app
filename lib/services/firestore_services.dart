import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/todo.dart';

class FirestoreServices {
  final CollectionReference _todoCollection = FirebaseFirestore.instance.collection('todos');

  //create atau tambah task baru
  Future<void> addTodo(String taskName) async {
   final newTodo = Todo(id: '', task: taskName, isDone: false);
   await _todoCollection.add(newTodo.toMap());
  }

  Stream<List<Todo>> getTodos() {
    return _todoCollection
        .orderBy('creadedAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Todo.fromFirestore(doc)).toList());
  }


  //update atau centang box status
  Future<void> updateTodoStatus(String id, bool currentStatus) async {
    await _todoCollection.doc(id).update({'isDone': !currentStatus});
  }

  Future<void> deleteTodo(String id) async {
    await _todoCollection.doc(id).delete();
  }
  
}