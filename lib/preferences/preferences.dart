import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static bool _isDarkMode = false;
  static List<String> notes = [];

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get isDarkMode {
    return _prefs.getBool('isDarkMode') ?? _isDarkMode;
  }

  static set isDarkMode(bool value) {
    _isDarkMode = value;
    _prefs.setBool('isDarkMode', value);
  }

  static List<String> get notesList {
    return _prefs.getStringList('notes') ?? notes;
  }

  static set notesList(List<String> value) {
    notes = value;
    _prefs.setStringList('notes', value);
  }

  static void addNotes(String value) {
    notes.add(value);
    _prefs.setStringList('notes', notes);
  }

  static void removeNotes(int index) {
    notes.removeAt(index);
    _prefs.setStringList('notes', notes);
  }
}
