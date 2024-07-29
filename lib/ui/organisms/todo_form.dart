import 'package:flutter/material.dart';
import 'package:todo_app_case/ui/atoms/text_field.dart';
import '../atoms/submit_button.dart';

class TodoForm extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final GlobalKey<FormState> formKey;
  final VoidCallback onSave;

  const TodoForm({
    Key? key,
    required this.titleController,
    required this.descriptionController,
    required this.formKey,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextInputField(
            controller: titleController,
            label: 'Title',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a title';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextInputField(
            controller: descriptionController,
            label: 'Description',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a description';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomButton(onPressed: onSave, text: 'Add'),
        ],
      ),
    );
  }
}
