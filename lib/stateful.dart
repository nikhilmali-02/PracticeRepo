import 'package:flutter/material.dart';
import 'main.dart';


class MyAap extends StatelessWidget {
  const MyAap ({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome();
  @override
  State<StatefulWidget> createState() =>_MyHome();
}

class _MyHome extends State<MyHome>{
  var counter = 0;
  @override
  Widget build(BuildContext context) {
    print("BUILD CALLED");
    return Scaffold(
      appBar: AppBar(
          title: Text("Stateful")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("COUNTER: $counter",style: TextStyle(fontSize: 30),),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              setState(() {
                counter++;
              });
            }, child: Text("Increase",style: TextStyle(fontWeight: FontWeight.bold),) ),
            ElevatedButton(onPressed: (){
              setState(() {
                counter--;
              });
            }, child: Text("Decrease",style: TextStyle(fontWeight: FontWeight.bold),) )
          ],
        ),
      ),
    );
  }

}

