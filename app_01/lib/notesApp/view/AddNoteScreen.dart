import 'package:flutter/material.dart';
import 'package:app_01/notesApp/model/NoteUser.dart';
import '../db/NoteDatabaseHelper.dart';
import 'NoteForm.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NoteForm(
      onSave: (note) async {
        await NoteDatabaseHelper.instance.insertNote(note);
        Navigator.pop(context, true); // báo thành công để reload list
      },
    );
  }
}