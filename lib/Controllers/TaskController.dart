import 'package:app/Services/Service_28.dart';
import 'package:flutter/material.dart';

class Taskcontroller extends ChangeNotifier{
  final TaskService service;

  Taskcontroller(this.service);

  bool isLoading = false;
  List<String> task = [];
  String? error;

  Future<void> loadTasks() async{
    if (isLoading) return;

    try{
      final result = await service.fetchTask();
      task = result;
    } catch(e){
      error = 'Failed to load';
      task = [];
    } finally{
      isLoading = false;
      notifyListeners();//retyped 8 March
    }
  }
}