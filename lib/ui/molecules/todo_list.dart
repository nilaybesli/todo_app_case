import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_case/controllers/todo_controller.dart';
import 'package:todo_app_case/ui/atoms/todo_list_tile.dart';
import 'package:todo_app_case/ui/atoms/search_field.dart';
import 'package:todo_app_case/ui/views/add_todo_screen.dart';

class TodoList extends StatelessWidget {
  final bool isCompleted;

  const TodoList({
    super.key,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.find();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: SearchField(
            onChanged: (query) {
              todoController.searchTodos(query);
            },
          ),
        ),
        Expanded(
          child: Obx(() {
            if (todoController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            var todos = todoController.getFilteredTodos(isCompleted);
            if (todos.isEmpty) {
              return const Center(child: Text('No todos available.'));
            }

            return ListView.builder(
              itemBuilder: (context, index) {
                final todo = todos[index];
                return TodoListTile(
                  todo: todo,
                  onTap: () {
                    Get.to(() => AddTodoScreen(todo: todo));
                  },
                  onCheckboxChanged: (bool? value) {
                    todoController.toggleTodoCompletion(todo);
                  },
                  onDelete: () {
                    todoController.deleteTodo(todo.id);
                  },
                );
              },
              itemCount: todos.length,
            );
          }),
        ),
      ],
    );
  }
}
