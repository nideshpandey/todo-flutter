import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/model.dart';
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
    List<Todo> todos = (context).watch<TodoLogic>().getTodos();
    //print(todos);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddTodo(
                        topTitle: 'Add Todo',
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
                          onTap: () => (context)
                              .read<TodoLogic>()
                              .completedStatus(index),
                          onLongPress: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddTodo(
                                      topTitle: 'Edit Todo', index: index))),
                          leading: Text(
                            todos[index].title,
                            style: TextStyle(
                                decoration: (context)
                                        .watch<TodoLogic>()
                                        .todos[index]
                                        .completed
                                    ? TextDecoration.lineThrough
                                    : null),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Confirm Deletion'),
                                    content: const Text(
                                        'Are you sure you want to delete ?'),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text('Cancel')),
                                      TextButton(
                                          onPressed: () {
                                            (context)
                                                .read<TodoLogic>()
                                                .removeTodo(index);
                                            Navigator.pop(context);
                                          },
                                          child: Text('Delete')),
                                    ],
                                  ),
                                );
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
