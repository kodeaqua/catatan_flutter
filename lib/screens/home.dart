import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catatan"),
        centerTitle: true,
      ),
      drawer: const Drawer(),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Test"),
            subtitle: const Text("Lorem ipsum dolor sir amet"),
            onTap: () {},
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, '/add'),
        label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.add),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
            ),
            Text("Tambah"),
          ],
        ),
      ),
    );
  }
}
