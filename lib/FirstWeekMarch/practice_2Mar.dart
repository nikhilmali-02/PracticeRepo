import 'package:app/Controllers/TaskController.dart';
import 'package:app/Services/Service_28.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TwoMar extends StatelessWidget {
  const TwoMar ({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TwoMarHome(),
    );
  }
}

class TwoMarHome extends StatefulWidget  {
  const TwoMarHome({super.key});
  @override
  State<TwoMarHome> createState() =>TwoMarState();
}

class TwoMarState extends State<TwoMarHome> {
  late final Taskcontroller controller;//retyped 8 March

  @override
  void initState() {
    super.initState();
    controller = Taskcontroller(TaskService());
    controller.addListener(_onUpdate);
    controller.loadTasks();
  }//retyped 8 March

  void _onUpdate(){
   setState(() {

   });
  }//retyped 8 March

  @override
  void dispose() {
    controller.removeListener(_onUpdate);
    super.dispose();
  }   //retyped 8 March

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: controller.isLoading
              ? CircularProgressIndicator()
              : controller.error != null
              ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Failed to load"),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: controller.loadTasks, child: Text("Retry"))
            ],
          )
              : RefreshIndicator(child:
          ListView.builder(
              itemCount: controller.task.length,
              itemBuilder: (context,index)=> ListTile(
                title: Text(controller.task[index]),
              )
          )
              , onRefresh: controller.loadTasks)
      ),
    );
  }


}