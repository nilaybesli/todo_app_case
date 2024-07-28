import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_case/controllers/todo_controller.dart';
import 'package:todo_app_case/data/models/todo_model.dart';

class AddTodoScreen extends StatefulWidget {
  final Todo? todo;

  const AddTodoScreen({super.key, this.todo});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final TodoController todoController = Get.find();

  void addOrUpdate() {
    if (_formKey.currentState!.validate()) {
      if (widget.todo != null) {
        todoController.updateTodo(Todo(
          id: widget.todo!.id,
          title: _titleController.text,
          description: _descriptionController.text,
          createdAt: widget.todo!.createdAt,
          isCompleted: widget.todo!.isCompleted,
        ));
      } else {
        todoController.addTodo(
          Todo(
              id: DateTime.now().toString(),
              title: _titleController.text,
              description: _descriptionController.text,
              createdAt: DateTime.now()),
        );
      }
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: addOrUpdate, child: const Text("Add"))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
