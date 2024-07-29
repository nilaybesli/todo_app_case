import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../molecules/form_input_field.dart';
import '../atoms/submit_button.dart';
import '../../data/services/auth_service.dart';
import '../views/login_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void signUpUser() async {
    if (_formKey.currentState!.validate()) {
      String res = await AuthService().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _nameController.text,
      );

      if (res == 'success') {
        Get.snackbar('Success', 'User registered successfully');
        Get.to(() => const LoginScreen());
      } else {
        Get.snackbar('Error', res);
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FormInputField(
            controller: _emailController,
            label: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          FormInputField(
            controller: _nameController,
            label: 'Full name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a full name';
              }
              return null;
            },
          ),
          FormInputField(
            controller: _passwordController,
            label: 'Password',
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomButton(onPressed: signUpUser, text: 'Sign Up'),
        ],
      ),
    );
  }
}
