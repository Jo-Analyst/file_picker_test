import 'package:flutter/material.dart';
// import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DirectoryPickerScreen(),
    );
  }
}

class DirectoryPickerScreen extends StatefulWidget {
  const DirectoryPickerScreen({super.key});
  @override
  State<DirectoryPickerScreen> createState() => _DirectoryPickerScreenState();
}

class _DirectoryPickerScreenState extends State<DirectoryPickerScreen> {
  String selectedDirectory = "";

  Future<void> pickDirectory() async {
    final result = await FilePicker.platform.getDirectoryPath();
    if (result != null) {
      setState(() {
        selectedDirectory = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Directory Picker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                pickDirectory();
              },
              child: const Text("Selecionar Diretório"),
            ),
            const SizedBox(height: 20),
            const Text(
              "Diretório Selecionado:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(selectedDirectory),
          ],
        ),
      ),
    );
  }
}
