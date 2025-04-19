import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app_01/notesApp/model/NoteUser.dart';

class NoteDetailScreen extends StatelessWidget {
  final Note note;

  const NoteDetailScreen({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('dd/MM/yyyy HH:mm');

    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết ghi chú'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(note.title, style: Theme.of(context).textTheme.headlineSmall),
                SizedBox(height: 8),
                Text('Ưu tiên: ${note.priority}'),
                Text('Tạo lúc: ${formatter.format(note.createdAt)}'),
                Text('Cập nhật: ${formatter.format(note.modifiedAt)}'),
                SizedBox(height: 16),
                Text(note.content),
                SizedBox(height: 16),
                if (note.tags != null && note.tags!.isNotEmpty)
                  Wrap(
                    spacing: 8,
                    children: note.tags!.map((tag) => Chip(label: Text(tag))).toList(),
                  ),
                if (note.color != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text('Màu: ${note.color}'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
