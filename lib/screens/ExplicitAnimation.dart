import 'package:flutter/material.dart';

class ExplicitAnimation extends StatelessWidget {
  const ExplicitAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explicit Animation',
      theme: ThemeData(primarySwatch: Colors.green),
      home: ExplicitAnimationScreen(),
    );
  }
}

class ExplicitAnimationScreen extends StatefulWidget {
  @override
  _ExplicitAnimationScreenState createState() =>
      _ExplicitAnimationScreenState();
}

class _ExplicitAnimationScreenState extends State<ExplicitAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: animationController,
      child: Container(
        width: 200,
        height: 200,
        color: Colors.green,
        child: const Center(
          child: Text(
            'Explicit Animation',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
