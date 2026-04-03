import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThreeApril extends StatelessWidget {
  const ThreeApril({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ThreeApril_Home(),
    );
  }
}

class ThreeApril_Home extends StatefulWidget {
  @override
  State<ThreeApril_Home> createState() => ThreeApril_State();
}

class ThreeApril_State extends State<ThreeApril_Home> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(key: _formKey,
            child: Column(
              children: [TextFormField(
              validator: (value){
                if(value==null || value.isEmpty){
                  return "This Field is Requiered";
                }
                return null;
              },
                        ),
             TextFormField(
              validator: (value){
                if(value==null || value.isEmpty){
                  return "This field is required";
                }
                if(value.length <= 6){
                  return "minimum 6 Characters";
                }
                return null;
              },
            ),
              ]
          ),
        ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            if(_formKey.currentState!.validate()){
              print("Login Successful");
            }
            else{return print("Unsuccessful");}
          }, child: Text("Login")
          ),
        ]),
      ),
    );
  }
}