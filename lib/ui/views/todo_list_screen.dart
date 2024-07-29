import 'package:flutter/material.dart';
import 'package:todo_app_case/ui/molecules/todo_list.dart';

class TodoListScreen extends StatelessWidget {
  final bool isCompleted;

  const TodoListScreen({super.key, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TodoList(isCompleted: isCompleted),
    );
  }
}
