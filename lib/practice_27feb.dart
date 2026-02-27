import 'dart:math';

import 'package:flutter/material.dart';

class TwoSeven extends StatelessWidget {
  const TwoSeven({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TwoSevenHome(),
    );

  }
}

class TwoSevenHome extends StatefulWidget {
  @override
  State<TwoSevenHome> createState()=>TwoSevenState();
}

class TwoSevenState extends State<TwoSevenHome> {
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
    try {
      await Future.delayed(Duration(seconds: 2));

      if(Random().nextBool()){
        throw Exception("Error");
      }
      setState(() {
        task = ['task a','task b','task c'];
      });
    } catch(e){
      setState(() {
        error = "Failed to Load";
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
              children: [
                Text("Failed to load"),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: loadTask,
                    child: Text("Retry"))
              ],
            )
            : Column(children: [
              Expanded(child: ListView.builder(
                  itemCount: task.length,
                  itemBuilder: (_,index)=>ListTile(
                    title: Text(task[index]),
                  )
              ))
        ],
        )
      ),
    );
  }

}