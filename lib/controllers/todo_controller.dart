import 'package:get/get.dart';
import 'package:todo_app_case/data/models/todo_model.dart';
import '../data/services/todo_service.dart';

class TodoController extends GetxController {
  var todoList = <Todo>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  void fetchTodos() async {
    isLoading(true);
    try {
      var todos = await TodoService().getTodos();
      todoList.assignAll(todos);
      // rxlist metodu, mevcut içeriği temizler tüm öğeleri listeler
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

  void addTodo(Todo todo) async {
    await TodoService().addTodo(todo);
    fetchTodos();
  }

  void updateTodo(Todo todo) async {
    await TodoService().updateTodo(todo);
    fetchTodos();
  }

  void deleteTodo(String id) async {
    await TodoService().deleteTodo(id);
    fetchTodos();
  }

  List<Todo> getFilteredTodos(bool isCompleted) {
    return todoList.where((todo) => todo.isCompleted == isCompleted).toList();
  }

}
