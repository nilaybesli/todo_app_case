import 'package:flutter/material.dart';
import '../atoms/text_field.dart';

class FormInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final String? Function(String?) validator;

  const FormInputField({
    super.key,
    required this.controller,
    required this.label,
    this.isPassword = false,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextInputField(
        controller: controller,
        label: label,
        isPassword: isPassword,
        validator: validator,
      ),
    );
  }
}
