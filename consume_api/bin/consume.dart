import 'dart:convert';

import 'package:http/http.dart' as http;

Future main() async {
  final todo = await fetch();
  print(todo.toJson());
}

Future<Todo> fetch() async {
  var url = 'https://jsonplaceholder.typicode.com/todos/1';
  var response = await http.get(url);
  var json = jsonDecode(response.body);
  return Todo.fromJson(json);
}

class Todo {
  final int id;
  final int userId;
  final String title;
  final bool completed;

  Todo({this.id, this.userId, this.title, this.completed});

  factory Todo.fromJson(Map json) {
    return Todo(
        id: json['id'],
        userId: json['userId'],
        title: json['title'],
        completed: json['completed']);
  }

  Map toJson() {
    return {'id': id, 'userId': userId, 'title': title, 'completed': completed};
  }
}
