import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint(bloc.toString());
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint("$bloc : ${change.toString()}");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint("$bloc : ${transition.toString()}");
  }
}
