import 'package:flutter/material.dart';
import 'package:act2/preferences/preferences.dart';
import 'package:provider/provider.dart';

import 'providers/providers.dart';
import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NotesProvider(Preferences.notes)),
      ChangeNotifierProvider(create: (_) => ThemeProvider.bool(Preferences.isDarkMode)),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context, listen: true);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      themeMode: themeProvider.getThemeMode(),
      darkTheme: getDarkTheme(),
      theme: getTheme(),
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName: (_) => const HomeScreen(),
        SettingsScreen.routerName: (_) => const SettingsScreen()
      },
    );
  }

  getDarkTheme() {
    return ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: Colors.redAccent,
        )).copyWith(
      appBarTheme: const AppBarTheme(
        color: Colors.redAccent,
      ),
    );
  }

  getTheme() {
    return ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Colors.redAccent,
        )).copyWith(
      appBarTheme: const AppBarTheme(
        color: Colors.redAccent,
      ),
    );
  }
}
