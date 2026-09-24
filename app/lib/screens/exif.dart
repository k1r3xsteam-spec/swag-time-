import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../api.dart';
import '../theme.dart';

class ExifScreen extends StatefulWidget {
  const ExifScreen({super.key});
  @override
  State<ExifScreen> createState() => _S();
}

class _S extends State<ExifScreen> {
  Map<String, dynamic>? res;
  bool loading = false;

  Future<void> pick() async {
    final f = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (f == null) return;
    setState(() => loading = true);
    try {
      res = await Api.exif(File(f.path));
    } catch (e) {
      res = {"error": e.toString()};
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("[ exif ]")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: pick,
                icon: const Icon(Icons.image),
                label: const Text("[ PICK PHOTO ]"),
              ),
            ),
            const SizedBox(height: 12),
            if (loading) const LinearProgressIndicator(color: SwagColors.red),
            if (res != null)
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: SwagColors.surface,
                      border: Border.all(color: SwagColors.border),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      res.toString(),
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 12,
                        color: SwagColors.green,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}