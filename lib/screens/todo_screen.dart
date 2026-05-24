import 'package:flutter/material.dart';
import 'package:app/Controllers/todo_controller.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatefulWidget{
  @override
  State<TodoScreen> createState() => TodoScreen_State();
}

class TodoScreen_State extends State<TodoScreen> {

  @override
  void initState() {
      super.initState();
      WidgetsBinding.instance.addPostFrameCallback((_){
        context.read<TodoController>().loadTodos();
      });

  }
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<TodoController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: Center(
          child: controller.isLoading
              ? const CircularProgressIndicator()
              : controller.error != null
                ? Text("Error")
              : ListView.builder(
              itemCount: controller.todos.length,
              itemBuilder: (_,index) => ListTile(title: Text(controller.todos[index].title),)
          ),
      )
    );
  }
}