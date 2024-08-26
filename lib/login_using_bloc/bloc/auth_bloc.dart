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
  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    debugPrint("From onChange : ${change.toString()}");
  }

  //onTransition also give us the event which cause the transition but on change donot give
  //onTransition is not available in cubit as cubit donot work on event
  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);
    debugPrint("From onTransition : ${transition.toString()}");
  }

  void _onAuthLoginRequested(
      AuthLoginRequest event, Emitter<AuthState> emit) async {
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

  void _onAuthLogoutRequested(
      AuthLogoutRequest event, Emitter<AuthState> emit) async {
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
