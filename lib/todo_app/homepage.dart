import 'package:bloc_counter_app/todo_app/add_todo.dart';
import 'package:bloc_counter_app/todo_app/model/todo.dart';
import 'package:bloc_counter_app/todo_app/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoHomePage extends StatelessWidget {
  const TodoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Todos are as follows"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AddTodo()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) {
          return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, i) {
                return Text("${i + 1}. ${todos[i].name}");
              });
        },
      ),
    );
  }
}
