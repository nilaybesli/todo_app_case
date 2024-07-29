import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_case/ui/views/home_screen.dart';
import 'package:todo_app_case/ui/views/login_screen.dart';
import 'package:todo_app_case/ui/views/signup_screen.dart';

import 'controllers/todo_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCz_a-O6Iyc1bQt2wKsNctl1IB1avKQu6o",
      appId: "1:384697882616:web:3a349c12326f69d939e80d",
      messagingSenderId: "384697882616",
      projectId: "todo-app-case",
      storageBucket: "todo-app-case.appspot.com",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TodoController());

    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: LoginScreen(),
    );
  }
}
