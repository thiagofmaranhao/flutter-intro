import 'package:flutter/material.dart';

import 'controllers/todo_controller.dart';

class TodoView extends StatefulWidget {
  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  final controller = TodoController();

  _start() {
    return Container();
  }

  _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _success() {
    return ListView.builder(
      itemCount: controller.todos.length,
      itemBuilder: (context, index) {
        var todo = controller.todos[index];
        return ListTile(
          leading: Checkbox(
            value: todo.completed,
            onChanged: (bool value) {},
          ),
          title: Text(todo.title),
        );
      },
    );
  }

  _error() {
    return Center(
      child: RaisedButton(
        onPressed: () {
          controller.start();
        },
        child: Text('Tente novamente'),
      ),
    );
  }

  stateManagement(TodoState state) {
    switch (state) {
      case TodoState.start:
        return _start();
      case TodoState.loading:
        return _loading();
      case TodoState.success:
        return _success();
      case TodoState.error:
        return _error();
      default:
        return _start();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset('assets/images/avatar.jpg'),
              ),
              accountName: Text('Teste'),
              accountEmail: Text('teste@teste.com'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Início'),
              subtitle: Text('Tela de Início'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.pending_actions),
              title: Text('Todo'),
              subtitle: Text('Todo List'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/todo');
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Sair'),
              subtitle: Text('Finalizar sessão'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Todo List'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh_outlined),
            onPressed: () {
              controller.start();
            },
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return stateManagement(controller.state.value);
        },
      ),
    );
  }
}
