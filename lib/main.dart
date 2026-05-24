import 'package:app/April/practice_3April.dart';
import 'package:app/April/practice_4April.dart';
import 'package:app/Controllers/todo_controller.dart';
import 'package:app/March/31march_practice.dart';
import 'package:app/LastWeekFeb/practice_24feb.dart';
import 'package:app/LastWeekFeb/practice_26feb.dart';
import 'package:app/Services/network_service_22May.dart';
import 'package:app/realAPI.dart';
import 'package:app/screens/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'FakeApi.dart';
import 'stateful.dart';
import 'package:app/LastWeekFeb/practice_28feb.dart';

Future<void> main() async {
  await NetworkService().fetchTodoByUser(1);
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoController(),
      child: MaterialApp(
        title: 'Todo App',
      debugShowCheckedModeBanner: false,
      home: TodoScreen(),
      ),
    );
  }
}

class MyApplication extends StatefulWidget{
  MyApplication ({super.key, required this.title});
  final String title;
  @override
  State<MyApplication> createState() => _MyAppState(); 
}

class _MyAppState extends State<MyApplication> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    print("INIT");
  }


  final List<String> task = [];
  @override
  Widget build(BuildContext context) {
    print("BUILD");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: "Enter Task"
            ),
          ),
          ElevatedButton(onPressed: (){
            if(_controller.text.isEmpty) return ;
            print("ADD");
            setState(() {
              task.add(_controller.text);
              _controller.clear();
            });
          }, child: Text("ADD")
          ),
          ElevatedButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHome()));
          }, child: Text("NEXT")
          ),
          Expanded(child: ListView.builder(
              itemCount: task.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(task[index]),
                  trailing: IconButton(onPressed: (){
                    print("DELETE");
                    setState(() {
                      task.removeAt(index);
                    });
                  }, icon: Icon(Icons.delete)),
                );
              })
          )
        ],
    ),
    );
  }
  @override
  void dispose() {
    print("DISPOSE");
    _controller.dispose();
    super.dispose();
  }
} 