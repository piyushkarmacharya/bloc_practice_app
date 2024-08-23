import 'package:bloc_counter_app/counter_app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class IncrementDecrementPage extends StatelessWidget {
  const IncrementDecrementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              counterCubit.decrement();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Icon(Icons.minimize),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              counterCubit.increment();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
