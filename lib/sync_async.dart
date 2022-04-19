import 'dart:convert';
import 'package:http/http.dart' as http;

Future main() async {
  final todo = await fetch();
  print(todo.toJson());
}

Future<Todo> fetch() async {
  var url = 'https://jsonplaceholder.typicode.com/todos/1';
  var response = await http.get(Uri.parse(url));
  var json = jsonDecode(response.body);
  var todo = Todo.fromJson(json);
  return todo;
}

//{
//	"userId": 1,
//	"id": 1,
//	"title": "delectus aut autem",
//	"completed": false
//}

class Todo {
  final String title;
  final int id;
  final int userId;
  final bool completed;

  Todo(
      {required this.title,
      required this.id,
      required this.userId,
      required this.completed});

  factory Todo.fromJson(Map json) {
    return Todo(
        id: json['id'],
        completed: json['completed'],
        userId: json['userId'],
        title: json['title']);
  }

  Map toJson() {
    return {'id': id, 'title': title, 'completed': completed, 'userId': userId};
  }
}
