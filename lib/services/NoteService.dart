import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:du_firebase/models/Note.dart';

class Noteservice {
  final _collection = FirebaseFirestore.instance.collection('notes');

  Future<List<Note>> getNotes() async {
    final data = await _collection.get();
    if (data.docs.isNotEmpty) {
      return data.docs.map((doc) {
        final note = doc.data();
        return Note(
          id: doc.id,
          title: note['title'],
          content: note['content'],
        );
      }).toList();
    } else {
      return [];
    }
  }

  Future<Note> getNoteById(String id) async {
    final data = await _collection.doc(id).get();
    if (data.exists) {
      final note = data.data();
      return Note(
        id: data.id,
        title: note!['title'],
        content: note['content'],
      );
    } else {
      return Note(
        id: '',
        title: '',
        content: '',
      );
    }
  }

  Future<void> addNote(Note note) async {
    try {
      await _collection.add(note.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateNote(Note note) async {
    try {
      await _collection.doc(note.id).update(note.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteNoteById(String id) async {
    try {
      await _collection.doc(id).delete();
    } catch (e) {
      print(e);
    }
  }
}
