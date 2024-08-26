import 'package:bloc_counter_app/login_using_bloc/bloc/auth_bloc.dart';
import 'package:bloc_counter_app/login_using_bloc/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailCtr = TextEditingController();

  final TextEditingController passwordCtr = TextEditingController();

  @override
  void dispose() {
    debugPrint("dispose called");
    emailCtr.dispose();
    passwordCtr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFail) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
          if (state is AuthSuccess) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Homepage(name: state.usr.name)));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Email"),
                        TextFormField(
                          controller: emailCtr,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("Password"),
                        TextFormField(
                          controller: passwordCtr,
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                            child: ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<AuthBloc>(context).add(
                                      AuthLoginRequest(
                                          email: emailCtr.text,
                                          password: passwordCtr.text));
                                },
                                child: const Text("Login"))),
                      ],
                    ),
                  )),
            );
          }
        },
      ),
    );
  }
}
