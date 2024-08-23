import 'package:flutter/material.dart';

class AddTodo extends StatelessWidget {
  AddTodo({super.key});
  final TextEditingController ctr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: ctr,
          ),
          ElevatedButton(onPressed: () {}, child: Text("add"))
        ],
      ),
    );
  }
}
