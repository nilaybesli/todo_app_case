import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_case/ui/views/add_todo_screen.dart';
import '../../controllers/todo_controller.dart';

class TodoListScreen extends StatelessWidget {
  final bool isCompleted;

  const TodoListScreen({super.key, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.find();

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
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
                  return ListTile(
                    title: Text(todo.title),
                    subtitle: Text(todo.description),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          value: todo.isCompleted,
                          onChanged: (bool? value) {
                            todoController.toggleTodoCompletion(todo);
                          },
                        ),
                        IconButton(
                          onPressed: () {
                            todoController.deleteTodo(todo.id);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                    onTap: () {
                      Get.to(() => AddTodoScreen(
                            todo: todo,
                          ));
                    },
                  );
                },
                itemCount: todos.length,
              );
            }),
          ),
        ],
      ),
    );
  }
}
