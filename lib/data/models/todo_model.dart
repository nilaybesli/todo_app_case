import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String id;
  String title;
  String description;
  bool isCompleted;
  DateTime createdAt;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'createdAt': createdAt,
    };
  }

  factory Todo.fromSnapshot(DocumentSnapshot snapshot) {
    return Todo(
      id: snapshot.id,
      title: snapshot['title'],
      description: snapshot['description'],
      isCompleted: snapshot['isCompleted'] ?? false,
      createdAt: (snapshot['createdAt'] as Timestamp).toDate(),
    );
  }
}
