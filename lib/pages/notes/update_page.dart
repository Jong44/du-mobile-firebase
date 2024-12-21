import 'package:du_firebase/services/NoteService.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  final String id;
  const UpdatePage({super.key, required this.id});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  void getNote() async {
    final data = await Noteservice().getNoteById(widget.id);
    setState(() {
      _titleController.text = data.title;
      _contentController.text = data.content;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Page'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Title',
            ),
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Content',
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Update Note'),
          ),
        ],
      ),
    );
  }
}
