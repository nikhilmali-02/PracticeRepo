import 'package:app/Services/network_service_22May.dart';
import 'package:flutter/material.dart';

class TodoController extends ChangeNotifier  {

  List<TodoModel> todos = [];
  bool isLoading = false;
  String? error;

  Future<void> loadTodos()async {
    if(isLoading) return;

    isLoading = true;
    notifyListeners();

    try{
      final result = await NetworkService().fetchTodos();
      todos = result;
    } catch(e){
      error = 'Failed';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}