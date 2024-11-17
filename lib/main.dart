import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TimerScreen(),
    );
  }
}

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _currentSecond = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  // Timer function using Future.delayed
  void _startTimer() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {
          _currentSecond++;
        });
        _startTimer(); // Call the timer function again to keep it running
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer Example'),
      ),
      body: Center(
        child: Text(
          'Elapsed Time: $_currentSecond seconds',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
