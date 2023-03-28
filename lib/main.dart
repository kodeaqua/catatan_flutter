import 'package:flutter/material.dart';
import 'package:ngabuburit3/screens/add.dart';
import 'package:ngabuburit3/screens/home.dart';
import 'package:ngabuburit3/screens/edit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

ThemeData materialTheme({required bool darkmode}) {
  ThemeData baseTheme = ThemeData(
    useMaterial3: true,
  );
  return darkmode
      ? baseTheme.copyWith(brightness: Brightness.dark)
      : baseTheme.copyWith(brightness: Brightness.light);
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
        '/add': (context) => const AddNoteScreen(),
        '/edit': (context) => const EditNoteScreen()
      },
      initialRoute: '/',
    );
  }
}
