import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        key: const Key('counterApp'),
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$_counter',
            key: const Key('counterText'),
            style: const TextStyle(fontSize: 32),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                key: const Key('decrementBtn'),
                onPressed: _decrement,
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                key: const Key('resetBtn'),
                onPressed: _reset,
                icon: const Icon(Icons.refresh),
              ),
              IconButton(
                key: const Key('incrementBtn'),
                onPressed: _increment,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
