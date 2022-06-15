import 'package:flutter/material.dart';
import 'package:todo_flutter/models/model.dart';

class TodoLogic with ChangeNotifier {
  List<Todo> todos = [];

  void addTodo(Todo data) {
    todos.add(data);
    notifyListeners();
  }

  void removeTodo(int index) {
    todos.removeAt(index);
    notifyListeners();
  }

  void updateTodo(int index, Todo updated) {
    todos[index] = updated;
    notifyListeners();
  }

  void completedStatus(int index){
    Todo todo = todos[index];
    todo.completed = !todo.completed;
    todos[index] = todo;
    notifyListeners();

  }

  List<Todo> getTodos() {
    return todos;
  }
}
