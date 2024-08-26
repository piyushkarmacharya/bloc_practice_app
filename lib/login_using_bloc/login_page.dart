import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          title: Text("Login Page"),
        ),
        body: Padding(
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
                            onPressed: () {}, child: Text("Login"))),
                  ],
                ),
              )),
        ));
  }
}
