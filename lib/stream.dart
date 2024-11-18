import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamExampleScreen(),
    );
  }
}

class StreamExampleScreen extends StatefulWidget {
  @override
  _StreamExampleScreenState createState() => _StreamExampleScreenState();
}

class _StreamExampleScreenState extends State<StreamExampleScreen> {
  late Stream<int> numberStream;
  late StreamSubscription<int> subscription;
  List<int> receivedNumbers = [];

  @override
  void initState() {
    super.initState();
    numberStream = _createNumberStream();
    subscription = numberStream.listen(
      (number) {
        setState(() {
          receivedNumbers.add(number); // Add each emitted number to the list
        });
      },
      onDone: () {
        print("Stream closed!");
      },
    );
  }

  @override
  void dispose() {
    subscription
        .cancel(); // Cancel the subscription when the widget is disposed
    super.dispose();
  }

  Stream<int> _createNumberStream() async* {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(Duration(seconds: 1)); // Emit a number every second
      yield i; // Emit the number
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stream Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Numbers from Stream:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              receivedNumbers.isEmpty
                  ? 'No numbers received yet'
                  : receivedNumbers.join(', '),
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
