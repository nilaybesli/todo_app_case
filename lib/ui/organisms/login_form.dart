import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../molecules/form_input_field.dart';
import '../atoms/submit_button.dart';
import '../../data/services/auth_service.dart';
 import '../views/home_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void loginUser() async {
    if (_formKey.currentState!.validate()) {
      String res = await AuthService().loginUser(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (res == 'success') {
        Get.snackbar('Success', 'User logged in successfully');
        Get.off(() => const HomeScreen());
      } else {
        Get.snackbar('Error', res);
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          SubmitButton(onPressed: loginUser, text: 'Login'),
        ],
      ),
    );
  }
}
