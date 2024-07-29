import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_case/controllers/todo_controller.dart';
import 'package:todo_app_case/data/models/todo_model.dart';
import '../organisms/todo_form.dart';

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

  void saveTodo() {
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
            createdAt: DateTime.now(),
          ),
        );
      }
      Get.back();
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      _titleController.text = widget.todo!.title;
      _descriptionController.text = widget.todo!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.todo != null ? 'Edit Todo' : 'Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: TodoForm(
            titleController: _titleController,
            descriptionController: _descriptionController,
            formKey: _formKey,
            onSave: saveTodo,
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
