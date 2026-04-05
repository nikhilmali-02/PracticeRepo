import 'package:flutter/material.dart';

class TaskOne extends ChangeNotifier {
    final TaskSeva seva;

    TaskOne(this.seva);

    bool isLoading = false;
    List<String> task = [];
    String? error;

    Future<void> loadTask() async {
      if(isLoading) return;

      isLoading = true;
      notifyListeners();

      try{
        final result = await seva.fetchTask;
        task = result;
      } catch{
        error = "Failed";
        task=[];
      } finally{
        isLoading = false;
        notifyListeners();
      }
    }

}