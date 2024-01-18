import 'package:act2/preferences/preferences.dart';
import 'package:flutter/material.dart';

class NotesProvider extends ChangeNotifier {
  final List<String> _notesList = [];

  NotesProvider(List<String> notes) {
    _notesList.addAll(notes);
  }

  List<String> get notesList => _notesList;

  void addNotes(String note) {
    Preferences.addNotes(note);
    _notesList.add(note);
    notifyListeners();
  }

  void removeNotes(int index) {
    _notesList.removeAt(index);
    Preferences.removeNotes(index);
    notifyListeners();
  }
}
