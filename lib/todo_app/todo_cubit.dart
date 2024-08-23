import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_counter_app/todo_app/model/todo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([Todo(name: "Initial Todo", uploadDate: DateTime.now())]);

  void addTodo(String name) {
    emit([...state, Todo(name: name, uploadDate: DateTime.now())]);
  }
}
