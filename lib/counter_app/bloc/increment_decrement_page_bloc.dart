import 'package:bloc_counter_app/counter_app/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class IncrementDecrementPage extends StatelessWidget {
  const IncrementDecrementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              counterBloc.add(CounterDecrement());
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Icon(Icons.minimize),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              counterBloc.add(CounterIncrement());
              //add the event to get value changed
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
