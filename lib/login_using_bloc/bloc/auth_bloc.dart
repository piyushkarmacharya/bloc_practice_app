import 'package:bloc_counter_app/login_using_bloc/model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequest>(_onAuthLoginRequested);
    on<AuthLogoutRequest>(_onAuthLogoutRequested);
  }
  void _onAuthLoginRequested(event, emit) async {
    emit(AuthLoading());
    //donot keep return as we need to run below codes after this
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
        return emit(AuthSuccess(usr: User(name: email, uid: 11, token: "aaa")));
      });
    } catch (e) {
      emit(AuthFail(e.toString()));
    }
  }

  void _onAuthLogoutRequested(event, emit) async {
    emit(AuthLoading());
    try {
      await Future.delayed(const Duration(seconds: 2), () {
        return emit(AuthInitial());
      });
    } catch (e) {
      emit(AuthFail(e.toString()));
    }
  }
}
