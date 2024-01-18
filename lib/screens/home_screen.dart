import 'package:flutter/material.dart';
import 'package:act2/preferences/preferences.dart';
import 'package:act2/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routerName = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: const SideMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Dark Mode ${Preferences.isDarkMode}'),
            const Divider(),
            Text('Gènere ${Preferences.genere}'),
            const Divider(),
            Text('Nom d\'usuari: ${Preferences.name}'),
            const Divider()
          ],
        ));
  }
}
