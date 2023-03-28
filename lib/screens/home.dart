import 'package:flutter/material.dart';
import 'package:ngabuburit3/helpers/database.dart';

import 'package:ngabuburit3/models/catatan.dart';

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
      body: FutureBuilder<List<Catatan>>(
        future: DatabaseHelper.instance.getCatatan(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return snapshot.data!.isNotEmpty
              ? ListView(
                  children: snapshot.data!.map((catatan) {
                    return ListTile(
                      title: Text(catatan.title),
                      onTap: () => Navigator.pushNamed(context, '/edit'),
                      onLongPress: () {
                        setState(() {
                          DatabaseHelper.instance.remove(catatan.id!);
                        });
                      },
                    );
                  }).toList(),
                )
              : Center(
                  child: Text(
                  "Belum ada catatan 😅",
                  style: Theme.of(context).textTheme.bodyLarge,
                ));
        },
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
