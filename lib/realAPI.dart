import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Realapi extends StatelessWidget {
  const Realapi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Myreal(),
    );
  }
}

class Myreal extends StatefulWidget {
  const Myreal({super.key});

  @override
  State<Myreal> createState() => MyrealState();
}

class Todo {
  final int id;
  final String title;
  final bool completed;

  Todo({
      required this.id,
      required this.title,
      required this.completed
  });

  factory Todo.fromJson(Map<String, dynamic> json){
    return Todo(id: json['id'],
        title: json['title'],
        completed: json['completed']
    );
  }
}

class MyrealState extends State<Myreal>{
  bool isLoading = false;
  List<Todo> todos = [];
  String? error ;

  Future<List<Todo>> fetchTodos() async{
    final uri = Uri.parse(
        'https://jsonplaceholder.typicode.com/todos?_limit=5',
    );

    final response  = await http.get(uri);

    if(response.statusCode == 200)  {
      final List data =   jsonDecode(response.body);
      return data.map((e)=> Todo.fromJson(e)).toList();
    } else {
        throw Exception("Failed to load Todos");
    }
  }

  @override
  void initState() {
    super.initState();
    loadTodos();
  }

  Future<void> loadTodos() async {
    setState(() {
      print("Loading");
      isLoading = true;
      error = null;
    });

    try{
      var todos = await fetchTodos();
    } catch (e) {
      setState(() {
        print(e);
        error = e.toString();
      });
    } finally {
      setState(() {
        print("Finally");
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading){
      return const Center(child: CircularProgressIndicator(),);
    }
    if(error != null){
      return Center(child: Text(
        error!,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.red),
      )
        ,);
    }
    return Scaffold(
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(todos[index].title),
              trailing: Icon(
                todos[index].completed ? Icons.check_circle : Icons.circle_outlined
              ),
            );
          }
      ),
    );
  }
}