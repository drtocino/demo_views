import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownEditor extends StatefulWidget {

  String content;
  final Function(String a)? save;
  MarkdownEditor({super.key, required this.content, required this.save});

  @override
  MarkdownEditorState createState() => MarkdownEditorState();
}

class MarkdownEditorState extends State<MarkdownEditor> with SingleTickerProviderStateMixin {

  late TabController controller;
  late TextEditingController controllerInput;
  // MarkdownEditorState({})
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controllerInput = TextEditingController(text: widget.content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meeting Note'),
        actions: [
          IconButton(onPressed: (widget.save!(widget.content)), icon: const Icon(Icons.save, color: Colors.white,))
        ],
        bottom: TabBar(
          controller: controller,
          tabs: const [
            Tab(
              child: Text("Editing"/*, style: TextStyle(color: Colors.black),*/),
            ),
            Tab(
              child: Text("Preview",/* style: TextStyle(color: Colors.black),*/),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              maxLines: null,
              controller: controllerInput,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Write down a Note"
              ),
              onChanged: (String text){
                setState(() {
                  widget.content = text;
                });
              },
            ),
          ),
          Markdown(data: widget.content),
        ],
      ),
    );
  }
}