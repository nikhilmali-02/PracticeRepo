import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApplication(title:"ToDOM" ),
    );
  }
}

class MyApplication extends StatefulWidget{
  MyApplication ({super.key, required this.title});
  final String title;
  @override
  State<MyApplication> createState() => _MyAppState(); 
}

class _MyAppState extends State<MyApplication> {
  TextEditingController _controller = TextEditingController();
  final List<String> task = [];
  @override
  Widget build(BuildContext context) {
    print("BUILD");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: "Enter Task"
            ),
          ),
          ElevatedButton(onPressed: (){
            if(_controller.text.isEmpty) return ;
            print("ADD");
            setState(() {
              task.add(_controller.text);
              _controller.clear();
            });
          }, child: Text("ADD")
          ),
          Expanded(child: ListView.builder(
              itemCount: task.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(task[index]),
                  trailing: IconButton(onPressed: (){
                    print("DELETE");
                    setState(() {
                      task.removeAt(index);
                    });
                  }, icon: Icon(Icons.delete)),
                );
              }
          )
          )
        ],
    ),
    );
    
  }
} 