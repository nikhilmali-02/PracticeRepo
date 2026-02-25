import 'package:flutter/material.dart';

class prac1 extends StatelessWidget{
  const prac1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: prac1_home(),
    );
  }
}

class prac1_home extends StatefulWidget {
  @override
  State<prac1_home> createState() => prac1_State();
}

class prac1_State extends State<prac1_home>{
  bool isLoading = false;
  List<String> task = [];
  String? error;

  Future<List<String>> fetch_task() async{
    await Future.delayed(Duration(seconds: 2) );
    return ["Task A", "Task B" , "Task C"];
  }

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
      final result = await fetch_task();
      setState(() {
        task = result;
      });
    } catch(e){
      setState(() {
        error = "Failed to load Task";
      });
    } finally{
      isLoading = false;
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
            ElevatedButton(onPressed: (){
              loadTask();
            }, child: Text("Retry")),
          ],
        )
            : Column(
          children: [
            Expanded(child: ListView.builder(
                itemCount: task.length,
                itemBuilder: (_,index)=> ListTile(
                 title: Text(task[index]))
            )
            ),
            ElevatedButton(onPressed: loadTask, child: Text("Refersh"))
          ],
        )
      )
    );
  }
}
