import 'package:bloc_counter_app/todo_app/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodo extends StatelessWidget {
  AddTodo({super.key});
  final TextEditingController ctr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final todoCubit = BlocProvider.of<TodoCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo below"),
      ),
      body: Column(
        children: [
          TextField(
            controller: ctr,
          ),
          ElevatedButton(
              onPressed: () {
                todoCubit.addTodo(ctr.text.trim());
              },
              child: const Text("add"))
        ],
      ),
    );
  }
}
