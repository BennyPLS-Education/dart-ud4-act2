import 'package:act2/providers/notes_provider.dart';
import 'package:flutter/material.dart';
import 'package:act2/preferences/preferences.dart';
import 'package:act2/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routerName = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotesProvider>(context, listen: true);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: const SideMenu(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AddNotesDialog();
              },
            );
          },
          child: const Icon(Icons.add),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: provider.notesList.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text(provider.notesList[index]),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  provider.removeNotes(index);
                },
              ),
            ),
          ),
        ));
  }
}
