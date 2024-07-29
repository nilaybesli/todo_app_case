import 'package:flutter/material.dart';

class TodoForm extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final GlobalKey<FormState> formKey;
  final VoidCallback onSave;

  const TodoForm({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.formKey,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Title'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a title';
              }
              return null;
            },
          ),
          TextFormField(
            controller: descriptionController,
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
          ElevatedButton(onPressed: onSave, child: const Text("Save"))
        ],
      ),
    );
  }
}
