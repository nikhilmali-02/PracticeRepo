import 'dart:math';

import 'package:app/Controllers/TaskController.dart';
import 'package:app/Services/Service_28.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TowEight extends StatelessWidget {
  const TowEight ({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TowEightHome(),
    );
  }
}

class TowEightHome extends StatefulWidget  {
  const TowEightHome({super.key});
  @override
  State<TowEightHome> createState() =>TowEightState();
}

class TowEightState extends State<TowEightHome> {
  final Taskcontroller controller = Taskcontroller(TaskService());

  bool isLoading = false;
  List<String> task = [];
  String? error;

  @override
  void initState() {
    super.initState();
    loadTask();
  }

  Future<void> loadTask() async {
    if(isLoading) return;
    setState(() {
      isLoading = true;
      error = null;
    });
    try{
      final result = await controller.loadTasks();
      setState(() {
        task = result;
      });
    } catch (e){
      setState(() {
        error = "Error";
        task = [];
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
      body: Center(
        child: isLoading
        ? CircularProgressIndicator()
        : error != null
          ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Failed to load"),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: loadTask, child: Text("Retry"))
            ],
          )
        : RefreshIndicator(child:
        ListView.builder(
            itemCount: task.length,
            itemBuilder: (context,index)=> ListTile(
            title: Text(task[index]),
            )
        )
            , onRefresh: loadTask)
      ),
    );
  }
}