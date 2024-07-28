import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app_case/data/models/todo_model.dart';

class TodoService {
  final CollectionReference todoCollection =
      FirebaseFirestore.instance.collection('todos');

  Future<List<Todo>> getTodos() async {
    var result =
        await todoCollection.orderBy('createdAt', descending: true).get();
    return result.docs.map((e) => Todo.fromSnapshot(e)).toList();
  }

  Future<void> addTodo(Todo todo) async {
    await todoCollection.doc(todo.id).set(todo.toMap());
  }

  Future<void> updateTodo(Todo todo) async {
    await todoCollection.doc(todo.id).update(todo.toMap());
  }

  Future<void> deleteTodo(String id) async {
    await todoCollection.doc(id).delete();
  }
}
