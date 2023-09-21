import 'package:flutter/material.dart';

class TapCounter extends StatefulWidget {
  const TapCounter({super.key, required this.title});
  final String title;

  @override
  State<TapCounter> createState() => TapCounterState();
}

class TapCounterState extends State<TapCounter> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _incrementCounter,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 49, 157, 245),
              Color.fromARGB(255, 7, 106, 187)
            ]
          ),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(12),
        
        child: 
            Text(
              '$_counter Times Tapped Here',style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500, ), textAlign: TextAlign.center,
            ),
        // Row(
        //   children: <Widget>[
        //     // Text(
        //     //   '$_counter',
        //     //   style: Theme.of(context).textTheme.headlineMedium,
        //     // ),
        //   ],
        // ),
      ),
    );
  }
}