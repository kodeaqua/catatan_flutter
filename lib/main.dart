import 'package:flutter/material.dart';
import 'package:ngabuburit3/screens/add.dart';
import 'package:ngabuburit3/screens/home.dart';

void main() {
  runApp(const MyApp());
}

ThemeData materialTheme({required bool darkmode}) {
  return darkmode
      ? ThemeData.dark(useMaterial3: true)
      : ThemeData.light(useMaterial3: true); // #1 kudu difix
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: materialTheme(darkmode: false),
      darkTheme: materialTheme(darkmode: true),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomeScreen(),
        '/add': (context) => const AddNoteScreen()
      },
      initialRoute: '/',
    );
  }
}
