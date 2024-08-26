import 'package:bloc_counter_app/login_using_bloc/model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequest>((event, emit) async {
      try {
        final email = event.email;
        final password = event.password;
        final regEmail =
            RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
        if (!regEmail.hasMatch(email)) {
          emit(AuthFail("Invalid Email"));
          return;
        } else if (password.length < 6) {
          emit(AuthFail("Short Password"));
          return;
        }

        //this is where api is called
        await Future.delayed(const Duration(seconds: 2), () {
          return emit(
              AuthSuccess(usr: User(name: email, uid: 11, token: "aaa")));
        });
      } catch (e) {
        emit(AuthFail(e.toString()));
      }
    });
  }
}
