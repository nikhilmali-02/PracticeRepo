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

  Future<void> updateTodos() async { //23 may
    final update = await http.patch(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
    headers: {'Content-type': 'application/json'},
    body: jsonEncode({'title':'Update Todo'}),
    );

    if (update.statusCode == 200){
     print('updated');
    } else {
      throw Exception("Error");
    }
  }

  Future<void> deleteTodos(int id) async { //23 may
    final delete = await http.delete(Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'));

    if(delete.statusCode == 200){
      print("Deleted");
    } else {
      throw Exception('Error');
    }
  }

  Future<void> createTodos() async { //23 may 2026
    final post = await http.post(Uri.parse('https://jsonplaceholder.typicode.com/todos'),
      headers:{'Content-type' : 'application/json'},
      body: jsonEncode({'title': 'Test todo', 'completed': false, 'userId': 1})
    );

    if(post.statusCode == 201){
      print(post.body);
    } else {
      throw Exception("error");
    }
  }
  
  Future<List<TodoModel>> fetchTodoByUser(int userId)  async {
    final todos = await http.get(Uri.https('jsonplaceholder.typicode.com','/todos',{'userId':userId.toString()}));

    if(todos.statusCode == 200){
      List<dynamic> task = jsonDecode(todos.body);
      List<TodoModel> tasks = [];
      for(var item in task){
        var todolist = TodoModel.fromJson(item);
        print(todolist.title);
        tasks.add(todolist);
      }
      return tasks;
    } else {
      throw Exception('Error');
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