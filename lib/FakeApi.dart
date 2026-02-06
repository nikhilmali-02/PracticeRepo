import 'package:flutter/material.dart';

void main(){
  runApp(const FakeTodo());
}

class FakeTodo extends StatelessWidget {
  const FakeTodo({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyFake (),
    );
  }
}

class MyFake extends StatefulWidget {
  const MyFake({super.key});

  @override
  State<MyFake> createState() => MyFakeState();
}

class MyFakeState extends State<MyFake> {
  bool isLoading = false ;
  List<String> task = [];
  String? error;

  Future<List<String>> fetchTasks() async{
      await Future.delayed(const Duration(seconds: 2));
      return ["Task A","Task B","Task C"];
  }
  @override
  void initState() {
      super.initState();
      loadTask();
  }

  Future<void> loadTask()  async {
    setState(() {
      isLoading = true;
      error = null;
    });

    try {
      final result = await fetchTasks();
      setState(() {
        task = result;
      });
    } catch (e){
      setState(() {
        error = "Failed to load tasks";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
  if (isLoading){
    return const Center(child: CircularProgressIndicator(),);
  }
  if (error != null){
    return Center(child: Text(error!),);
  }
  return Scaffold(
    body: ListView.builder(
        itemCount: task.length,
        itemBuilder: (_,index) => ListTile(
          title: Text(task[index]),
        )
    ),
  );
  }
}