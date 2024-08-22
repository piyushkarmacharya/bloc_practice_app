import 'package:flutter_bloc/flutter_bloc.dart';

class CounterIncrement {}
//these are the events
//we cannot make function and call emit in bloc. we need to call an event

class CounterBloc extends Bloc<CounterIncrement, int> {
  CounterBloc() : super(10) {
    on<CounterIncrement>((event, emit) {
      //must specify the event as an generic type
      emit(state + 1);
    });
  }
}
