import 'package:du_firebase/models/Note.dart';
import 'package:du_firebase/pages/notes/list_page.dart';
import 'package:du_firebase/services/NoteService.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'Title',
                ),
              ),
              TextField(
                controller: _contentController,
                decoration: const InputDecoration(
                  hintText: 'Content',
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  Note note = Note(
                    title: _titleController.text,
                    content: _contentController.text,
                  );
                  await Noteservice().addNote(note);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const ListPage();
                  }));
                },
                child: const Text('Add Note'),
              ),
            ],
          ),
        ));
  }
}
