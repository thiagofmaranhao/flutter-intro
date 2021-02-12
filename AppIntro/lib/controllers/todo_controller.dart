import 'package:AppIntro/models/todo_model.dart';
import 'package:AppIntro/repositories/todo_repository.dart';
import 'package:flutter/cupertino.dart';

class TodoController {
  List<TodoModel> todos = [];
  final _repository;
  final state = ValueNotifier<TodoState>(TodoState.start);

  TodoController([TodoRepository repository])
      : _repository = repository ?? TodoRepository();

  Future start() async {
    state.value = TodoState.loading;
    try {
      todos = await _repository.fecthTodos();
      state.value = TodoState.success;
    } catch (e) {
      state.value = TodoState.error;
    }
  }
}

enum TodoState { start, loading, success, error }
