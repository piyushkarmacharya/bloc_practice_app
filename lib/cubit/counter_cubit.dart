import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  void increment() {
    emit(state +
        1); //cannot do state=state+1 because state is only for read only
    //use emit() and arguments inside this method are used for changing state
  }
  //we cannot use emit outside this class as it is protected

  void decrement() {
    if (state == 0) {
      return;
    } else {
      emit(state - 1);
    }
  }
}
