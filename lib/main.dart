import 'package:flutter/material.dart';

class CounterIncrementor extends StatelessWidget {
  const CounterIncrementor({required this.onPressed, Key? key})
      : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: const Text('Add'));
  }
}

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({required this.counter, Key? key}) : super(key: key);
  final int counter;
  @override
  Widget build(BuildContext contextn) {
    return Text('Contador: $counter');
  }
}

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold é um layout para
    // a maioria dos Componentes Material
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CounterIncrementor(onPressed: _increment),
        const SizedBox(
          width: 16,
        ),
        CounterDisplay(
          counter: _counter,
        )
      ],
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        child: Counter(),
      ),
    ),
  ));
}
