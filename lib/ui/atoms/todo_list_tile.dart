import 'package:flutter/material.dart';
import 'package:todo_app_case/data/models/todo_model.dart';

class TodoListTile extends StatelessWidget {
  final Todo todo;
  final VoidCallback onTap;
  final ValueChanged<bool?>? onCheckboxChanged;
  final VoidCallback onDelete;

  const TodoListTile({
    super.key,
    required this.todo,
    required this.onTap,
    this.onCheckboxChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      subtitle: Text(todo.description),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: todo.isCompleted,
            onChanged: onCheckboxChanged,
          ),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
