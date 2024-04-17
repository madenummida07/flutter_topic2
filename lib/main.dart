import 'package:flutter/material.dart';

void main() {
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 50;

  void _updateCounter(int value) {
    setState(() {
      _counter += value;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Counter App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: TextStyle(fontSize: 64.0, fontWeight: FontWeight.bold),
            ),
            Row(
              children: <Widget>[
                CounterButton(
                  onPressed: () => _updateCounter(-1),
                  icon: Icons.remove,
                  color: Colors.red,
                ),
                CounterButton(
                  onPressed: () => _updateCounter(1),
                  icon: Icons.add,
                  color: Colors.green,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
          ],
        ),
      ),
    );
  }
}

class CounterButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final Color color;

  CounterButton({required this.icon, required this.onPressed, required this.color});

  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: () => onPressed(),
      ),
    );
  }
}


