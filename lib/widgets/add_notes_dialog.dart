import 'package:act2/preferences/preferences.dart';
import 'package:act2/providers/notes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNotesDialog extends StatefulWidget {
  const AddNotesDialog() : super(key: null);

  @override
  State<AddNotesDialog> createState() => _AddNotesDialogState();
}

class _AddNotesDialogState extends State<AddNotesDialog> {
  String note = '';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotesProvider>(context, listen: false);

    return AlertDialog(
      title: const Text('Add Notes'),
      content: TextField(
        decoration: const InputDecoration(hintText: 'Notes'),
        onChanged: (value) {
          note = value;
        },
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel')),
        TextButton(
            onPressed: () {
              provider.addNotes(note);
              Navigator.pop(context);
            },
            child: const Text('Add')),
      ],
    );
  }
}
