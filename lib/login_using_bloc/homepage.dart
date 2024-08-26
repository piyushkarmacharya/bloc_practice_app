import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final String name;
  const Homepage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
    );
  }
}
