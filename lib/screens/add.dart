import 'package:flutter/material.dart';
import 'package:ngabuburit3/helpers/sqflite.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // void controllerListener({required TextEditingController controller}) {
  //   final String text = controller.text;
  //   controller.value = controller.value.copyWith(
  //     text: text,
  //     selection:
  //         TextSelection(baseOffset: text.length, extentOffset: text.length),
  //     composing: TextRange.empty,
  //   );
  // }

  @override
  void initState() {
    super.initState();
    // _titleController.addListener(
    //   () => controllerListener(controller: _titleController),
    // );
    // _bodyController.addListener(
    //   () => controllerListener(controller: _bodyController),
    // );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catatan baru"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Judul catatan",
              ),
              maxLength: 32,
              validator: (value) {
                return value == null || value.isEmpty
                    ? "Tidak boleh kosong"
                    : null;
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
            ),
            TextFormField(
              controller: _bodyController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Isi catatan",
              ),
              maxLines: 8,
              maxLength: 255,
              validator: (value) {
                return value == null || value.isEmpty
                    ? "Tidak boleh kosong"
                    : null;
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Catatan disimpan")),
            );
            Navigator.pop(context);
          }
        },
        label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.save_outlined),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
            ),
            Text("Simpan"),
          ],
        ),
      ),
    );
  }
}
