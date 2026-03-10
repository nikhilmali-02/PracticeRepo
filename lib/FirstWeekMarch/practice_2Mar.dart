import 'package:app/Controllers/TaskController.dart';
import 'package:app/LastWeekFeb/practice_24feb.dart';
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
    return Scaffold(
      body: Center(
        child: Selector<Taskcontroller, bool>(
          selector: (_, c) => c.isLoading,
          builder: (_, isLoading, __) {

            if (isLoading) {
              return const CircularProgressIndicator();
            }

            return Selector<Taskcontroller, String?>(
              selector: (_, c) => c.error,
              builder: (_, error, __) {

                if (error != null) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Failed to load"),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed:
                        context.read<Taskcontroller>().loadTasks,
                        child: const Text("Retry"),
                      )
                    ],
                  );
                }

                return Selector<Taskcontroller, List<String>>(
                  selector: (_, c) => c.task,
                  builder: (_, tasks, __) {
                    return RefreshIndicator(
                      onRefresh:
                      context.read<Taskcontroller>().loadTasks,
                      child: ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (_, index) =>
                            ListTile(title: Text(tasks[index])),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }


}