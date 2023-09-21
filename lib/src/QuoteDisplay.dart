import 'package:flutter/material.dart';

class QuoteDisplay extends StatelessWidget {

  final dynamic quote;
  const QuoteDisplay({super.key, this.quote});

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(
        horizontal: 12
      ),
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.deepOrange,
            Color.fromARGB(255, 225, 135, 90),
          ]
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10)
        )
      ),
      child: Column(
        children: [
          const Icon(Icons.code, color: Colors.white),
          Text(quote.content, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20), textAlign: TextAlign.center,),
          Text("- " + quote.author + " -", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500, fontSize: 14), textAlign: TextAlign.left,)
        ]
      )
    );
  }
}