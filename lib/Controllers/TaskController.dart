import 'package:app/Services/Service_28.dart';

class Taskcontroller {
  final TaskService service;

  Taskcontroller(this.service);

  Future<List<String>> loadTasks() async {
    return await service.fetchTask();
  }
}