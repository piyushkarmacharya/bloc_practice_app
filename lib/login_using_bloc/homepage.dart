import 'package:bloc_counter_app/login_using_bloc/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state as AuthSuccess;
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(authState.usr.name),
            actions: [
              IconButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(AuthLogoutRequest());
                  },
                  icon: Icon(Icons.logout))
            ],
          ),
        );
      },
    );
  }
}
