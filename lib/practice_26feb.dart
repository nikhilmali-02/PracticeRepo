import 'dart:math';

import 'package:flutter/material.dart';

class TwoSix extends StatelessWidget{
  const TwoSix({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TwoSixHome(),
    );
  }
}

class TwoSixHome extends StatefulWidget {
  const TwoSixHome({super.key});
  @override
  State<TwoSixHome> createState() => TwoSixState();
}

class TwoSixState extends State<TwoSixHome> {
  bool isLoading = true;
  List<String> task = [];
  String? error;

  @override
  void initState() {
    super.initState();
    loadTask();
  }

  Future<void> loadTask() async {
    setState(() {
      isLoading = true;
      error = null;
    });

    try{
     await Future.delayed(Duration(seconds: 2));

     if (Random().nextBool()){
       throw Exception("Failed to load");
     }
     setState(() {
       task = ['Task A',"Task B","Task C"];
     });
    } catch (e){
      setState(() {
        error = "Failed to load";
        task = [];
      });
    } finally{
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
          ? const CircularProgressIndicator()
          : error != null
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Error"),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: loadTask, child: Text("Retry"))
            ],
          )
              : Column(
            children: [
              Expanded(child: ListView.builder(
                  itemCount: task.length,
                  itemBuilder: (_,index)=> ListTile(
                    title: Text(task[index]),
                  )
              )
              )
            ],
          )
        ),
      );
  }
}