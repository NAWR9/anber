import 'package:anber/Models/sakka_database.dart';
import 'package:anber/Pages/home_page.dart';
import 'package:anber/Themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  //initialize note isar database
  WidgetsFlutterBinding.ensureInitialized();
  await SakkaDatabase.initialize();

  SharedPreferences pref = await SharedPreferences.getInstance();

  bool? isDarkMode;

  if (pref.getBool("DarkMode") ?? false) {
    isDarkMode = pref.getBool("DarkMode");
  } else {
    isDarkMode = false;
  }
  runApp(MultiProvider(
    providers: [
      // Note Provider
      ChangeNotifierProvider(
        create: (context) => SakkaDatabase(),
      ),
      // Theme Provider
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(isDarkMode!),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: HomePage(),
    );
  }
}
