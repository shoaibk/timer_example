import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Schedule a microtask to navigate after the current build completes
    Future.microtask(() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SecondScreen(),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Center(
        child: Text('You will be navigated to the second screen shortly!'),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: Text('Welcome to the second screen!'),
      ),
    );
  }
}
