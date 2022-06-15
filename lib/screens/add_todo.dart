import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/model.dart';
import 'package:todo_flutter/todo_logic.dart';

class AddTodo extends StatelessWidget {
  final List<Todo>? todo;

  AddTodo({Key? key, this.topTitle, this.index, this.todo}) : super(key: key);
  final String? topTitle;
  final int? index;

  final todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topTitle!),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 500,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    labelText: 'Write your Todo',
                    floatingLabelAlignment: FloatingLabelAlignment.center),
                controller: todoController,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          TextButton(
              onPressed: () {
                if (index != null) {
                  (context)
                      .read<TodoLogic>()
                      .updateTodo(index!, Todo(title: todoController.text));
                } else {
                  (context)
                      .read<TodoLogic>()
                      .addTodo(Todo(title: todoController.text));
                }

                Navigator.pop(context);
              },
              child: Text(
                topTitle == 'Add Todo' ? 'Add Todo' : 'Edit Todo',
                style: const TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }
}
