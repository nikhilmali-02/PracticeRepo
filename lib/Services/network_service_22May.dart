import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkService  {

  Future<List<TodoModel>> fetchTodos() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if(response.statusCode == 200){
    final List<dynamic> todos = jsonDecode(response.body);
    List<TodoModel> todom = [];
    for (var item in todos){
      var todolist = TodoModel.fromJson(item);
      print(todolist.title);
      todom.add(todolist);
    }
    return todom;
    } else {
      throw Exception(response.statusCode);
    }
  }
}

class TodoModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed
  });

  factory TodoModel.fromJson (Map<String, dynamic> Json){
    return TodoModel(
    userId: Json['userId'],
    id: Json['id'],
    title: Json['title'],
    completed: Json['completed']);
  }
}