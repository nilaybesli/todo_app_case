import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final String? Function(String?) validator;

  const TextInputField({
    super.key,
    required this.controller,
    required this.label,
    this.isPassword = false,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: validator,
    );
  }
}
