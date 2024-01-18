import 'package:flutter/material.dart';
import 'package:act2/preferences/preferences.dart';
import 'package:act2/providers/providers.dart';
import 'package:act2/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String routerName = 'settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        drawer: const SideMenu(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Configuració', style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300)),
                const Divider(),
                SwitchListTile(
                    value: Preferences.isDarkMode,
                    title: const Text('Dark Mode'),
                    onChanged: (value) {
                      Preferences.isDarkMode = value;
                      var themeProvider = Provider.of<ThemeProvider>(context, listen: false);
                      themeProvider.toggleTheme(value);
                      setState(() {});
                    }),
                const Divider(),
                RadioListTile<int>(
                    value: 1,
                    groupValue: Preferences.genere,
                    title: const Text('Masculino'),
                    onChanged: (value) {
                      Preferences.genere = value ?? 1;
                      setState(() {});
                    }),
                const Divider(),
                RadioListTile<int>(
                    value: 2,
                    groupValue: Preferences.genere,
                    title: const Text('Femenino'),
                    onChanged: (value) {
                      Preferences.genere = value ?? 1;
                      setState(() {});
                    }),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: Preferences.name,
                    onChanged: (value) {
                      Preferences.name = value;
                      setState(() {});
                    },
                    decoration: const InputDecoration(labelText: 'Nom', helperText: 'Nom de l\'usuari'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
