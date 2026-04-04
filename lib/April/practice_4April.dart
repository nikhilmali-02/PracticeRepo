import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FourApril extends StatelessWidget {
  const FourApril({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FourApril_Home(),

    );
  }
}

class FourApril_Home extends StatefulWidget {
  const FourApril_Home({super.key});
  @override
  State<FourApril_Home> createState() => FourApril_State();
}

class FourApril_State extends State<FourApril_Home> {

  bool isDarkMode = false;

  Future<void> preFerence() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      isDarkMode = prefs.getBool("isDarkMode") ?? false;
    });
  }

  Future<void> savepreference(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', value);
  }

  @override
  void initState() {
    super.initState();
    preFerence();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SwitchListTile(
          title: const Text('Theme'),
            subtitle: const Text('Enable Dark Theme'),
            secondary: const Icon(Icons.change_circle),
            value: isDarkMode, onChanged: (bool value){
          setState(() {
            isDarkMode = value;
          });
          savepreference(value);
        }),
      ),
    );
  }
}