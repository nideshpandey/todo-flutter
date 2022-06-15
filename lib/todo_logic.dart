import 'package:flutter/material.dart';
import 'package:todo_flutter/models/model.dart';

class TodoLogic with ChangeNotifier {
  List<Todo> todos = [];
  bool completed = false;

  void addTodo(Todo data) {
    todos.add(data);
    notifyListeners();
  }

  void removeTodo(int index) {
    todos.removeAt(index);
    notifyListeners();
  }

  void updateTodo(int index, String updated) {
    //todos[index] = updated;
    notifyListeners();
  }

  void completedStatus(int index){
    //completed = !completed;
    Todo todo = todos[index];
    todo.completed = !todo.completed;
    todos[index] = todo;
    notifyListeners();

  }

  List<Todo> getTodos() {
    return todos;
  }
}
