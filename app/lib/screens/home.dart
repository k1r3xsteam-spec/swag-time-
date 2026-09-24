import 'package:flutter/material.dart';
import '../theme.dart';
import 'username.dart';
import 'email.dart';
import 'domain.dart';
import 'url.dart';
import 'phone.dart';
import 'exif.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ("USERNAME", Icons.person_search, const UsernameScreen()),
      ("EMAIL", Icons.alternate_email, const EmailScreen()),
      ("DOMAIN", Icons.language, const DomainScreen()),
      ("URL", Icons.link, const UrlScreen()),
      ("PHONE", Icons.phone_android, const PhoneScreen()),
      ("EXIF", Icons.image, const ExifScreen()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("[ swag_time v1.0 ]"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Center(
              child: Text("5/9",
                  style: TextStyle(
                    color: SwagColors.red,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (_, i) {
          final e = items[i];
          return InkWell(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => e.$3)),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: SwagColors.surface,
                border: Border.all(color: SwagColors.border),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  Icon(e.$2, color: SwagColors.red),
                  const SizedBox(width: 14),
                  Text("[+] ${e.$1}",
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        color: SwagColors.text,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      )),
                  const Spacer(),
                  const Icon(Icons.chevron_right, color: SwagColors.dim),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}