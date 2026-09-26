import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/guides_osint.dart';
import '../theme.dart';

class GuideDetailScreen extends StatelessWidget {
  final GuideItem item;
  const GuideDetailScreen({super.key, required this.item});

  Future<void> _open() async {
    final uri = Uri.parse(item.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("[ guide ]")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.title,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  color: SwagColors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 12),
            Text(item.desc,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  color: SwagColors.text,
                  fontSize: 14,
                )),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: SwagColors.surface,
                border: Border.all(color: SwagColors.border),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(item.url,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    color: SwagColors.green,
                    fontSize: 12,
                  )),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _open,
                icon: const Icon(Icons.open_in_browser),
                label: const Text("[ ОТКРЫТЬ ]"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}