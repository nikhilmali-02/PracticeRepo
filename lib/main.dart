import 'package:app/31march_practice.dart';
import 'package:app/LastWeekFeb/practice_24feb.dart';
import 'package:app/LastWeekFeb/practice_26feb.dart';
import 'package:app/realAPI.dart';
import 'package:flutter/material.dart';
import 'FakeApi.dart';
import 'stateful.dart';
import 'package:app/LastWeekFeb/practice_28feb.dart';

void main(){
  runApp(ThirtyOne());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApplication(title:"ToDOM" ),
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