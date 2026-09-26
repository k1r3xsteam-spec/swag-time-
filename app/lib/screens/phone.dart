import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../api.dart';
import '../theme.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});
  @override
  State<PhoneScreen> createState() => _S();
}

class _S extends State<PhoneScreen> {
  final c = TextEditingController();
  Map<String, dynamic>? res;
  bool loading = false;

  Future<void> run() async {
    if (c.text.trim().isEmpty) return;
    setState(() => loading = true);
    try {
      res = await Api.phone(c.text.trim());
    } catch (e) {
      res = {"error": e.toString()};
    }
    setState(() => loading = false);
  }

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dorks = (res?["dorks"] as List?) ?? [];

    return Scaffold(
      appBar: AppBar(title: const Text("[ phone ]")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: c,
              style: const TextStyle(
                  fontFamily: 'monospace', color: SwagColors.text),
              decoration: const InputDecoration(
                  labelText: "> введи номер (+79991234567)"),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: loading ? null : run,
                child: Text(loading ? "[*] checking..." : "[ RUN ]"),
              ),
            ),
            const SizedBox(height: 12),
            if (loading) const LinearProgressIndicator(color: SwagColors.red),
            if (res != null)
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
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
                      if (dorks.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        const Text("// поиск упоминаний",
                            style: TextStyle(
                              fontFamily: 'monospace',
                              color: SwagColors.red,
                              fontSize: 12,
                              letterSpacing: 1.1,
                            )),
                        const SizedBox(height: 8),
                        ...dorks.map<Widget>((d) {
                          final m = d as Map;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: InkWell(
                              onTap: () => _open(m["url"] as String),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: SwagColors.surface,
                                  border: Border.all(color: SwagColors.border),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  m["query"] as String,
                                  style: const TextStyle(
                                    fontFamily: 'monospace',
                                    color: SwagColors.text,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}