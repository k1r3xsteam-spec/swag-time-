import 'package:flutter/material.dart';
import '../api.dart';
import '../theme.dart';

class IpScreen extends StatefulWidget {
  const IpScreen({super.key});
  @override
  State<IpScreen> createState() => _S();
}

class _S extends State<IpScreen> {
  final c = TextEditingController();
  Map<String, dynamic>? res;
  bool loading = false;

  Future<void> run() async {
    if (c.text.trim().isEmpty) return;
    setState(() => loading = true);
    try {
      res = await Api.ip(c.text.trim());
    } catch (e) {
      res = {"error": e.toString()};
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("[ ip ]")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: c,
              style: const TextStyle(
                  fontFamily: 'monospace', color: SwagColors.text),
              decoration: const InputDecoration(
                  labelText: "> введи IP (8.8.8.8)"),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: loading ? null : run,
                child: Text(loading ? "[*] looking up..." : "[ RUN ]"),
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