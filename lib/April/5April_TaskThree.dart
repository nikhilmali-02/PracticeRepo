import 'dart:math';

import 'package:app/Controllers/FiveApril_TaskOne.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskThree extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => TaskOne(seva())..loadTask(),
    child: MaterialApp(
        home: TaskFour(),
    ),);
  }

}

class TaskFour extends StatefulWidget {
  @override
  State<TaskFour> createState() => TaskFour_State();
}

class TaskFour_State extends State<TaskFour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Selector<TaskOne,bool>(
            selector: (_,c)=> c.isLoading,
            builder: (_, isLoading, __){
              if(isLoading){
                return const CircularProgressIndicator();
              }

              return Selector<TaskOne,String?>(
                  selector: (_,c)=> c.error,
                  builder: (_, error, __){
                    if(error != null ){
                      return Text("Failed");
                    }
                    else{
                      return Selector<TaskOne,List<String>>(
                          selector: (_,c)=> c.task,
                        builder: (_,task,__){
                            return ListView.builder(
                              itemCount: task.length,
                                itemBuilder: (_,index)=>
                            ListTile(title: Text(task[index]))
                            ,),
                        }

                      )
                    }
                  } )
        }
        ),
              
      ),
    );

  }
}