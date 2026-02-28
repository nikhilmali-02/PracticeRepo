import 'dart:async';
import 'dart:math';

class TaskService {
  Future<List<String>> fetchTask() async {
    await Future.delayed(Duration(seconds: 2));

    final responseDelay = Random().nextInt(3);

    if(responseDelay==0){
      throw TimeoutException("Timeout");
    }
    if(responseDelay==1){
      throw Exception("Error");
    }
    return ['task a','task b','task c'];
  }
}