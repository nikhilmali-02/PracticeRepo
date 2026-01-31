import 'package:app/stateful.dart';
import 'package:flutter/material.dart';
import 'stateful.dart';
void main(){
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title:'ToDo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this. title});
  final String title;

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  final TextEditingController _controller = TextEditingController();
  final List<String> tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(padding: const EdgeInsets.all(16),
      child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: "Enter Task",
              ),
      ),
      const SizedBox(height: 20,),
      ElevatedButton(onPressed: (){
        if(_controller.text.isEmpty) return;
        setState(() {
          tasks.add(_controller.text);
          _controller.clear();
        });
      }, child: Text("Add"),
      ),
      Expanded(child: ListView.builder(itemCount : tasks.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(tasks[index]),
              trailing: IconButton(onPressed: (){
                setState(() {
                  tasks.removeAt(index);
                });
              }, icon: Icon(Icons.delete)),
            );
      }))
        ],
      ),),
    );
  }

}

