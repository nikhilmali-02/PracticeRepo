
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskFive extends StatelessWidget {
  TaskFive({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskFive_Home(),
    );
  }
}

class TaskFive_Home extends StatefulWidget {
  @override
  State<TaskFive_Home> createState() => TaskFive_State();
}

class TaskFive_State extends State<TaskFive_Home>{

  String username = "Bot";

  Future<void> preference() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      username = prefs.getString("username") ?? "Bot";
    });
  }

  Future<void> savepreference(String value)async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", value);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: savepreference(),
      ),
    );
  }
}