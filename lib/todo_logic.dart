import 'package:flutter/material.dart';

class TodoLogic with ChangeNotifier {
  List<String> todos = [];

  void addTodo(String data) {
    todos.add(data);
    notifyListeners();
  }

  void removeTodo(int index) {
    todos.removeAt(index);
    notifyListeners();
  }

  void updateTodo(int index, String updated) {
    todos[index] = updated;
    notifyListeners();
  }

  List getTodos() {
    return todos;
  }
}
