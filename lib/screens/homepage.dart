import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/screens/add_todo.dart';
import 'package:todo_flutter/todo_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todoLog = TodoLogic();

  @override
  Widget build(BuildContext context) {
    List todos = (context).watch<TodoLogic>().getTodos();
    print(todos);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddTodo(
                        title: 'Add Todo',
                      )));
        },
      ),
      appBar: AppBar(
        title: const Text('Simple Todos'),
      ),
      body: Center(
          child: (todos.isNotEmpty)
              ? ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) => Card(
                        child: ListTile(
                          onLongPress: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddTodo(
                                        title: 'Edit Todo', index: index
                                      ))),
                          leading: Text(todos[index]),
                          trailing: IconButton(
                              onPressed: () {
                                (context).read<TodoLogic>().removeTodo(index);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ),
                      ))
              : const Center(
                  child: Text('No Todos Added !'),
                )),
    );
  }
}
