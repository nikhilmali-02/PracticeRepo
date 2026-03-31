import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
    routes:[
      GoRoute(
          path: '/',
        builder: (context,state) => ThirtyOneHome(),
      ),
      GoRoute(path: '/detail/:id',
        builder: (context,state) => DetailScreen(
          id: state.pathParameters['id']!,
        ),
      ),
    ]);
class ThirtyOne extends StatelessWidget {
  const ThirtyOne({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}

class ThirtyOneHome extends StatefulWidget {
  const ThirtyOneHome({super.key});
  @override
  State<ThirtyOneHome> createState() => ThirtyOne_State();
}

class ThirtyOne_State extends State<ThirtyOneHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          context.go('/detail/5');
        }, child: Text('Next')),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String id;

  const DetailScreen({
    super.key,
    required this.id,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("$id"),
      ),
    );
  }
}