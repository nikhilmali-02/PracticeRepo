import 'dart:convert';
import 'dart:math';

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

class MyrealState extends State<Myreal> {
  bool isLoading = false;
  List<Todo> todos = [];
  String? error;

  Future<List<Todo>> fetchTodos() async {
    await Future.delayed(const Duration(seconds: 2));

    final random = Random();
    if (random.nextBool()) {
      throw Exception("simulated network Failure");
    }
    final response = await http
        .get(Uri.parse(
      'https://jsonplaceholder.typicode.com/todos?_limit=5',))
        .timeout(const Duration(seconds: 5));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Todo.fromJson(e)).toList();
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
      isLoading = true;
      error = null;
    });

    try {
      final result = await fetchTodos();
      setState(() {
        todos = result;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        todos = [];
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (error != null) {
      return Center(
        child: Column(
          children: [
            Text(
              error!,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 12,),
            ElevatedButton(
                onPressed: loadTodos,
                child:const Text("Retry"),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh:loadTodos,
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            trailing: Icon(
              todos[index].completed
                  ? Icons.check_circle
                  : Icons.circle_outlined,
            ),
          );
        },
      ),
    );
  }
}