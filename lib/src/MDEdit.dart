import 'package:flutter/material.dart';

class MDEdit extends StatelessWidget {
  String content;
  MDEdit({super.key, required this.content});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("data"),
          TextField(
            controller: TextEditingController(text: content),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            minLines: 10,
            maxLines: 20,
          )
        ],
      )
    );
  }
}