import 'package:AppIntro/controllers/todo_controller.dart';
import 'package:AppIntro/models/todo_model.dart';
import 'package:AppIntro/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

main() {
  test('deve preencher variável todos - web', () async {
    final controller = TodoController();

    expect(controller.state, TodoState.start);
    await controller.start();
    expect(controller.state, TodoState.success);

    expect(controller.todos.isNotEmpty, true);
  });

  test('deve preencher variável todos - mock', () async {
    final repository = TodoRepositoryMock();
    final controller = TodoController(repository);

    when(repository.fecthTodos()).thenAnswer((_) async => lista);

    expect(controller.state, TodoState.start);
    await controller.start();
    expect(controller.state, TodoState.success);

    expect(controller.todos.length, 4);
  });

  test('deve modificar estado do TodoController para error', () async {
    final repository = TodoRepositoryMock();
    final controller = TodoController(repository);

    when(repository.fecthTodos()).thenThrow(Exception());

    expect(controller.state, TodoState.start);
    await controller.start();
    expect(controller.state, TodoState.error);
  });
}

List<TodoModel> lista = [
  TodoModel(completed: true, id: 1, userId: 1, title: "asasasa"),
  TodoModel(completed: true, id: 2, userId: 2, title: "gdfdfda"),
  TodoModel(completed: true, id: 3, userId: 3, title: "ghgghgh"),
  TodoModel(completed: true, id: 4, userId: 4, title: "tytytyt")
];
