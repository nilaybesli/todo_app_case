import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_case/ui/views/add_todo_screen.dart';
import 'package:todo_app_case/ui/views/todo_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Todo App'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Get.to(() => const AddTodoScreen());
              },
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Completed'),
              Tab(text: 'Uncompleted'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TodoListScreen(isCompleted: true),
            TodoListScreen(isCompleted: false),
          ],
        ),
      ),
    );
  }
}
