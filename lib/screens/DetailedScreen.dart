import 'package:flutter/material.dart';

class DetailedScreen extends StatelessWidget {
  const DetailedScreen({super.key, required this.tag, required this.color});

  final String tag;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detailed Screen')),
      body: Center(
        child: Hero(
          tag: tag,
          child: Container(
            width: 300,
            height: 300,
            color: color,
            child: const Center(
              child: Text(
                'Detailed Screen',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
