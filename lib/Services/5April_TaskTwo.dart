class TaskTwo{
  Future<List<String>> fetchTask() async {
    await Future.delayed(Duration(seconds: 2));

    return ['task a','task b','task c'];
  }
}