import 'package:flutter/material.dart';
import 'package:todo_flutter/todo_logic.dart';
import 'package:provider/provider.dart';

class AddTodo extends StatelessWidget {
  AddTodo({Key? key}) : super(key: key);

  final todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
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
                (context).read<TodoLogic>().addTodo(todoController.text);
                Navigator.pop(context);
              },
              child: const Text(
                'Add Todo',
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }
}
