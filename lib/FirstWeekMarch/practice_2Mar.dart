import 'package:app/Controllers/TaskController.dart';
import 'package:app/Services/Service_28.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TwoMar extends StatelessWidget {
  const TwoMar ({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Taskcontroller(TaskService())..loadTasks(),
      child: MaterialApp(
        home: TwoMarHome(),
      ),
    );
  }
}

class TwoMarHome extends StatefulWidget  {
  const TwoMarHome({super.key});
  @override
  State<TwoMarHome> createState() =>TwoMarState();
}

class TwoMarState extends State<TwoMarHome> {

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<Taskcontroller>();
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