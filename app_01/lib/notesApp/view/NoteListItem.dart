import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app_01/notesApp/model/NoteUser.dart';
import 'NoteDetailScreen.dart';

class NoteListItem extends StatelessWidget {
  final Note note;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback? onTap;

  const NoteListItem({
    Key? key,
    required this.note,
    required this.onDelete,
    required this.onEdit,
    this.onTap,
  }) : super(key: key);

  Color _priorityColor(int priority) {
    switch (priority) {
      case 3:
        return Colors.yellow;
      case 2:
        return Colors.grey;
      case 1:
      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _priorityColor(note.priority),
          child: Text(
            note.title.isNotEmpty
                ? note.title[0].toUpperCase()
                : '?',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(note.title),
        subtitle: Text(
          note.content.length > 50
              ? '${note.content.substring(0, 50)}...'
              : note.content,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Xác nhận xoá'),
                    content: const Text('Bạn có chắc muốn xoá ghi chú này không?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Huỷ'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          onDelete();
                        },
                        child: const Text('Xoá'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        onTap: onTap ??
                () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => NoteDetailScreen(note: note),
                ),
              );
            },
      ),
    );
  }
}
