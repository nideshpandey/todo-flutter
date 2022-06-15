import 'package:flutter/material.dart';
import 'package:todo_flutter/todo_logic.dart';
import 'package:provider/provider.dart';

class AddTodo extends StatelessWidget {
  AddTodo({Key? key, this.title, this.index}) : super(key: key);
  final String? title;
  final int? index;

  final todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
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
                      .updateTodo(index!, todoController.text);
                } else {
                  (context).read<TodoLogic>().addTodo(todoController.text);
                }

                Navigator.pop(context);
              },
              child: Text(
                title == 'Add Todo' ? 'Add Todo' : 'Edit Todo',
                style: const TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }
}
