part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {
  final User usr;
  AuthSuccess({required this.usr}) {
    debugPrint(usr.name);
  }
}

final class AuthFail extends AuthState {
  final String error;
  AuthFail(this.error) {
    debugPrint(error);
  }
}
