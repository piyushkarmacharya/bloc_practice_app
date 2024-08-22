import 'package:flutter_bloc/flutter_bloc.dart';

sealed class CounterEvent {}

class CounterIncrement extends CounterEvent {}

class CounterDecrement extends CounterEvent {}
//these are the events
//we cannot make function and call emit in bloc. we need to call an event

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(10) {
    on<CounterIncrement>((event, emit) {
      //must specify the event as an generic type
      emit(state + 1);
    });
    on<CounterDecrement>((event, emit) {
      if (state == 0) {
        return;
      } else {
        emit(state - 1);
      }
    });
  }
}
