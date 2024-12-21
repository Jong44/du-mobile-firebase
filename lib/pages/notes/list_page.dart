import 'package:du_firebase/models/Note.dart';
import 'package:du_firebase/pages/notes/add_page.dart';
import 'package:du_firebase/pages/notes/update_page.dart';
import 'package:du_firebase/services/NoteService.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Note> notes = [];

  void getNotes() async {
    final data = await Noteservice().getNotes();
    setState(() {
      notes = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Page'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notes[index].title),
            subtitle: Text(notes[index].content),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await Noteservice().deleteNoteById(notes[index].id);
                getNotes();
              },
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdatePage(id: notes[index].id),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const AddPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
